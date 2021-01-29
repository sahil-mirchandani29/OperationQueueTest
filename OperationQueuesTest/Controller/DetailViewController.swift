//
//  DetailViewController.swift
//  OperationQueuesTest
//
//  Created by Sahil Mirchandani on 1/28/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailViewLabel: UILabel!
    var strText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewLabel.text = strText
        // Do any additional setup after loading the view.
    }
    

}
