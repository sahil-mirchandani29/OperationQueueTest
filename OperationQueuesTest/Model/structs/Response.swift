//
//  response.swift
//  ItunesSearch
//
//  Created by Sahil Mirchandani on 1/26/21.
//

import Foundation

class Response{
    var statusCode: Int? = nil
    var numberOfItems: Int? = nil
    var numberOfItems2: Int? = nil
    var numberOfItems3: Int? = nil
    
    var itemsUpdated: Int? = nil{
        didSet{
            if(itemsUpdated! >= numberOfItems!){
                Response.done = true
            }
        }
    }
    var itemsUpdated2: Int? = nil{
        didSet{
            if(itemsUpdated2! >= numberOfItems2!){
                Response.done2 = true
            }
        }
    }
    var itemsUpdated3: Int? = nil{
        didSet{
            if(itemsUpdated3! >= numberOfItems3!){
                Response.done3 = true
            }
        }
    }
    
    var items: [Item?] = []
    var items2: [Item2?] = []
    var items3: [Item3?] = []
    
    static var response1 = Response()
    static var response2 = Response()
    static var response3 = Response()
    
    static var done: Bool = false
    static var done2: Bool = false
    static var done3: Bool = false
    
    func getItemAtIndex(index: Int) -> Item?{
        if let itemsUpdated = itemsUpdated{
            if(index < itemsUpdated-1){
                return items[index]
            }
        }
        return nil
    }
    func getItem2AtIndex(index: Int) -> Item2?{
        if let itemsUpdated = itemsUpdated2{
            if(index < itemsUpdated-1){
                return items2[index]
            }
        }
        return nil
    }
    func getItem3AtIndex(index: Int) -> Item3?{
        if let itemsUpdated = itemsUpdated3{
            if(index < itemsUpdated-1){
                return items3[index]
            }
        }
        return nil
    }
    static func getInstance1() ->Response{
        return response1
    }
    static func getInstance2() ->Response{
        return response2
    }
    static func getInstance3() ->Response{
        return response3
    }
    
    func addItem1(item: Item){
        self.items.append(item)
    }
    func addItem2(item: Item2){
        self.items2.append(item)
    }
    func addItem3(item: Item3){
        self.items3.append(item)
    }
    
}

