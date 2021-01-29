//
//  TableViewController2.swift
//  OperationQueuesTest
//
//  Created by Sahil Mirchandani on 1/29/21.
//

import UIKit

class TableViewController2: UITableViewController {
    
    var item2: Item2?
    var rowNumber: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let item2 = item2{
            return item2.subItems.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell2") as! TableViewCell2
        cell.cell2Label.text = item2?.subItems[indexPath.row].date ?? "no date"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        rowNumber = indexPath.row
        performSegue(withIdentifier: "DetailViewSegue2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "DetailViewSegue2"){
            var text: String = ""
            if let subitem = item2?.subItems[rowNumber]{
                text += "confirmed = \(subitem.confirmed) \n"
                text += "deaths = \(subitem.deaths) \n"
                text += "recovered = \(subitem.recovered) \n"
            }
            let detailView = segue.destination as! DetailViewController
            detailView.strText = text
        }
    }

}
