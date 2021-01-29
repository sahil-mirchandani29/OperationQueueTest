//
//  APIViewController.swift
//  OperationQueuesTest
//
//  Created by Sahil Mirchandani on 1/28/21.
//

import UIKit

class APIViewController: UIViewController {
    
    var currentAPICall: API?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func API1buttonPressed(_ sender: Any) {
        currentAPICall = API.APICall1
        performSegue(withIdentifier: "TableViewSegue", sender: self)
    }
    
    @IBAction func API2buttonPressed(_ sender: Any) {
        currentAPICall = API.APICall2
        performSegue(withIdentifier: "TableViewSegue", sender: self)
    }
    
     @IBAction func API3buttonPressed(_ sender: Any) {
        currentAPICall = API.APICall3
        performSegue(withIdentifier: "TableViewSegue", sender: self)
     }
     // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "TableViewSegue"){
            let tableViewController = segue.destination as? TableViewController
            tableViewController?.APIcall = currentAPICall
        }
    }
    

}
