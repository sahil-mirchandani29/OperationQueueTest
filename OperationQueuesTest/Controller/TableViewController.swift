//
//  TableViewController.swift
//  OperationQueuesTest
//
//  Created by Sahil Mirchandani on 1/28/21.
//

import UIKit

class TableViewController: UITableViewController {
    
    var rowNumber: Int? = nil
    var tableViewManager: TableViewManager?
    static var results1Updated = false
    static var results2Updated = false
    static var results3Updated = false
    var APIcall: API?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentAPIcall = APIcall {
            tableViewManager = TableViewManager(ApiCall: currentAPIcall)
        }
        DispatchQueue.main.async {
            switch self.APIcall{
            case .APICall1:
                print("waiting for result1")
                while (TableViewController.results1Updated == false){}
                sleep(2)
                print("result1 updated")
                self.tableView.reloadData()
            case .APICall2:
                while (TableViewController.results2Updated == false){}
                sleep(2)
                self.tableView.reloadData()
            case .APICall3:
                print("waiting for api call3")
                while (TableViewController.results3Updated == false){}
                sleep(2)
                self.tableView.reloadData()
            case .none:
                self.tableView.reloadData()
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(tableViewManager?.getCount() ?? "error")
        return tableViewManager?.getCount() ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        cell.cellLabel.text = tableViewManager?.getData(index: indexPath.row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowNumber = indexPath.row
        if(APIcall == API.APICall1 || APIcall == API.APICall3){
            performSegue(withIdentifier: "DetailView", sender: self)
        }
        if(APIcall == API.APICall2){
            performSegue(withIdentifier: "TableViewSegue2", sender: self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "DetailView"){
            let detailView = segue.destination as! DetailViewController
            var Text: String = ""
            switch APIcall {
            case .APICall1:
                let item = Response.getInstance1().getItemAtIndex(index: rowNumber!)
                Text += "state = \(item!.state!)\n"
                Text += "Positive = \(item!.positive ?? 0) \n"
                Text += "deaths = \(item!.death ?? 0) \n"
                Text += "Hospitalized Currently = \( item!.hospitalizedCurrently ?? 0) \n"
                Text += "recoverd = \(item!.recovered ?? 0) \n"
                Text += "dateChecked = \(item!.dateChecked ?? "") \n"
                detailView.strText = Text
            case .APICall2:
                _ = Response.getInstance2().getItem2AtIndex(index: rowNumber!)
            case .APICall3:
                _ = Response.getInstance3().getItem3AtIndex(index: rowNumber!)
                detailView.strText = "\(String(describing: rowNumber))"
            case .none:
                let _ = 5
            }
            
        }
        if(segue.identifier == "TableViewSegue2"){
            if(APIcall == API.APICall2){
                let item2 = Response.getInstance2().getItem2AtIndex(index: rowNumber!)
                let tableView = segue.destination as! TableViewController2
                tableView.item2 = item2
                
            }
        }
    }
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        self.tableView.reloadData()
    }
    


}
