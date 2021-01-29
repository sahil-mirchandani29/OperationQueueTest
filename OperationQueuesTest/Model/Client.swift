//
//  itunesClient.swift
//  ItunesSearch
//
//  Created by Sahil Mirchandani on 1/26/21.
//

import Foundation

class Client{
    
    var baseURL:[String] = ["https://api.covidtracking.com/v1/states/daily.json", "https://pomber.github.io/covid19/timeseries.json","https://api.covid19india.org/v4/data-all.json"]
    let networkManager = NetworkManager()
    
    
    func search(response: Response, APIcall :API){
        let queue = OperationQueue()
        let urlString :String
        let seperator :String
        switch APIcall {
        case .APICall1:
            urlString = baseURL[0]
            seperator = "},"
        case .APICall2:
            urlString = baseURL[1]
            seperator = "],"
        case .APICall3:
            urlString = baseURL[2]
            seperator = "},"
        }
        if(APIcall == API.APICall1 || APIcall == API.APICall2){
            getresults(response: response, urlString: urlString , completion: {resultString in
                if(resultString == nil){
                    return
                }
                else{
                    let stringArray = resultString!.components(separatedBy: seperator)
                    print("number of Items = \(stringArray.count)")
                    switch APIcall {
                    case .APICall1:
                        response.numberOfItems = stringArray.count
                    case .APICall2:
                        response.numberOfItems2 = stringArray.count
                    case .APICall3:
                        response.numberOfItems3 = stringArray.count
                    }
                    response.statusCode = 200
                    queue.maxConcurrentOperationCount = 1
                    for Interval in stride(from: 0, to: stringArray.count, by: 50) {
                        queue.addOperation {
                            self.addtoresults(response: response, stringArray: Array(stringArray[Interval...min(stringArray.count-1,Interval+49)]), APICall: APIcall)
                        }
                    }
                }
            })
        }
        if(APIcall == API.APICall3){
            queue.addOperation {self.getresultsApiCall3(response: response, urlString: self.baseURL[2]) { (jsonResponse) in
                response.numberOfItems3 = jsonResponse?.keys.count
                for json in jsonResponse!{
                    let item_ = Item3(dictionary: json.key)
                    response.addItem3(item: item_!)
                }
                response.itemsUpdated3 = jsonResponse?.keys.count
                print("API3 all updated")
                TableViewController.results3Updated = true
                }
            }
        }
        queue.waitUntilAllOperationsAreFinished()
        switch APIcall {
        case .APICall1:
            TableViewController.results1Updated = true
        case .APICall2:
            TableViewController.results2Updated = true
        case .APICall3:
            TableViewController.results3Updated = true
        }
    }
    
    func addtoresults(response: Response, stringArray: [String], APICall: API){
        for var jsonString in stringArray{
            switch APICall {
            case .APICall1:
                jsonString = jsonString + "}"
                let tempdata = jsonString.data(using: .utf8)
                do{
                    if let json = try JSONSerialization.jsonObject(with: tempdata!, options: []) as? [String: Any]{
                        let item_ = Item(dictionary: json)!
                        response.addItem1(item: item_)
                    }
                }catch {print("Error")}
            case .APICall2:
                jsonString = "{" + jsonString
                jsonString += "]}"
                let tempdata = jsonString.data(using: .utf8)
                do{
                    if let json = try JSONSerialization.jsonObject(with: tempdata!, options: []) as? [String: Any]{
                        let item2_ = Item2(dictionary: json)!
                        response.addItem2(item: item2_)
                    }
                }catch {print("Error")}
            case .APICall3:
                jsonString = jsonString + "}"
            }
        }
        switch APICall {
        case .APICall1:
            if(response.itemsUpdated == nil){
                response.itemsUpdated = 50
            }else{response.itemsUpdated! += 50}
            print("\(String(describing: response.itemsUpdated)) got updated from 1st api")
        case .APICall2:
            if(response.itemsUpdated2 == nil){
                response.itemsUpdated2 = 50
            }else{response.itemsUpdated2! += 50}
            print("\(String(describing: response.itemsUpdated2)) got updated from 2nd api")
        case .APICall3:
            if(response.itemsUpdated3 == nil){
                response.itemsUpdated3 = 50
            }else{response.itemsUpdated3! += 50}
            print("\(String(describing: response.itemsUpdated3)) got updated from 3rd api")
        }
    }
    
    func getresults(response:Response, urlString: String, completion: @escaping (String?)->Void){
        
        let url = urlString
        print(url)
        
        networkManager.getJsonString(URLString: url, completion: {(jsonString, httpResponse, error) in
            if(jsonString == nil){
                response.statusCode = 220
                completion(nil)
                return
            }
            completion(jsonString)
        })
    }
    typealias JSON = [String : Any]
    func getresultsApiCall3(response:Response, urlString: String, completion: @escaping (JSON?)->Void){
        let url = urlString
        print(url)
        
        networkManager.getJson(URLString: url, completion: {(json, httpResponse, error) in
            if(json == nil){
                response.statusCode = 220
                completion(nil)
                return
            }
            //print(json?.keys)
            completion(json)
        }
        )
    }
    
}
