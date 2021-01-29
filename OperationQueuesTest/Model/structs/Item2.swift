//
//  Item2.swift
//  OperationQueuesTest
//
//  Created by Sahil Mirchandani on 1/28/21.
//

import Foundation

struct subItem{
    let confirmed: Int
    let date: String
    let deaths: Int
    let recovered: Int
    init(confirmed: Int, date: String, deaths: Int, recovered: Int) {
        self.confirmed = confirmed
        self.date = date
        self.deaths = deaths
        self.recovered = recovered
    }
}

struct Item2{
    let country: String
    var subItems: [subItem] = []
    
    init?(dictionary: [String: Any]){
        country = dictionary.keys.first!
        if let nsArray = dictionary["\(dictionary.keys.first!)"] as? NSArray{
            for array in nsArray{
                if let dict = array as? NSDictionary{
                    let subItem_ = subItem(confirmed: dict["confirmed"] as! Int, date: dict["date"] as! String, deaths: dict["deaths"] as! Int, recovered: dict["recovered"] as! Int)
                    subItems.append(subItem_)
                }
            }
            
        }
    }
}
