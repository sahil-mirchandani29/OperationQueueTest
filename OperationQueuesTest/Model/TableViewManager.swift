//
//  TableViewManager.swift
//  OperationQueuesTest
//
//  Created by Sahil Mirchandani on 1/28/21.
//

import Foundation


class TableViewManager{
    let queue = OperationQueue()
    var currentAPIcall: API?
    init(ApiCall: API) {
        currentAPIcall = ApiCall
        let searchOperation = BlockOperation{
            let client = Client()
            switch(ApiCall){
            case .APICall1:
                if(Response.done == false){
                    client.search(response: Response.getInstance1(), APIcall: ApiCall)
                }
            case .APICall2:
                if(Response.done2 == false){
                    client.search(response: Response.getInstance2(), APIcall: ApiCall)
                }
            case .APICall3:
                if(Response.done3 == false){
                    client.search(response: Response.getInstance3(), APIcall: ApiCall)
                }
            }
        }
        queue.addOperation(searchOperation)
    }
    func getCount() -> Int{
        switch currentAPIcall {
        case .APICall1:
            return Response.getInstance1().itemsUpdated ?? 0
        case .APICall2:
            return Response.getInstance2().itemsUpdated2 ?? 0
        case .APICall3:
            print(Response.getInstance3().itemsUpdated3)
            return Response.getInstance3().itemsUpdated3 ?? 0
        case .none:
            return 0
        }
    }
    func getData(index: Int) -> String{
        switch currentAPIcall {
        case .APICall1:
            if let currentItem = Response.getInstance1().getItemAtIndex(index: index){
                return currentItem.state ?? "no state"
            }
            return "Loading ... \(index)"
        case .APICall2:
            if let currentItem = Response.getInstance2().getItem2AtIndex(index: index){
                return currentItem.country
            }
            return "Loading ... \(index)"
        case .APICall3:
            if let currentItem = Response.getInstance3().getItem3AtIndex(index: index){
                return currentItem.date
            }
            return "Loading ... \(index)"
        case .none:
            return "Loading ... \(index)"
        }
        
    }
}
