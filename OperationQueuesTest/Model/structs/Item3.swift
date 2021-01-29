//
//  Item3.swift
//  OperationQueuesTest
//
//  Created by Sahil Mirchandani on 1/28/21.
//

import Foundation

typealias JSON = [String : Any]
struct Item3{
    let date: String
    
    init?(dictionary: String){
        date = "\(dictionary)"
    }
}
