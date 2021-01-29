//
//  NetworkManager.swift
//  OperationQueuesTest
//
//  Created by Sahil Mirchandani on 1/28/21.
//

import Foundation

struct NetworkManager {
    typealias JSONStringHandler = (String?, HTTPURLResponse?, Error?) -> Void
    func getJsonString(URLString: String, completion: @escaping JSONStringHandler){
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse else {
                    let userInfo = [NSLocalizedDescriptionKey : NSLocalizedString("Missing HTTP Response", comment: "")]
                    let error = NSError(domain: "Networking Error", code: 1, userInfo: userInfo)
                    completion(nil, nil, error as Error)
                    return
                }
                if data == nil {
                    if let error = error {
                        completion(nil, httpResponse, error)
                    }
                }else {
                    if(httpResponse.statusCode == 200){
                        do {
                            if let data = data {
                                let jsonString = String(data: data[1...data.count-4], encoding: .utf8)
                                completion(jsonString,httpResponse,nil)
                            }
                        }
                    }
                }
                
            }.resume()
        }
    }
    typealias JSON = [String : Any]
    typealias JSONHandler = (JSON?, HTTPURLResponse?, Error?) -> Void
    func getJson(URLString: String, completion: @escaping JSONHandler){
    if let url = URL(string: URLString) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                let userInfo = [NSLocalizedDescriptionKey : NSLocalizedString("Missing HTTP Response", comment: "")]
                let error = NSError(domain: "Networking Error", code: 1, userInfo: userInfo)
                completion(nil, nil, error as Error)
                return
            }
            if data == nil {
                if let error = error {
                    completion(nil, httpResponse, error)
                }
            }else {
                if(httpResponse.statusCode == 200){
                    do {
                        if let data = data {
                            do{
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
                            completion(json,httpResponse,nil)
                            }
                            }catch{print("error serializing")}
                        }
                    }
                }
            }
            
        }.resume()
    }
}
}
