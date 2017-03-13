//
//  AiportBizExt.swift
//  Qantas
//
//  Created by Reza Farahani on 14/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import Foundation

extension Airport {
    
    
    
    static func airports(matching query: String, completionHandler: @escaping (([Airport]) -> Void)) {
        
        let airportSvcEndpoint: String = "https://www.qantas.com.au/api/airports"
        
        guard let airportSvcEndpointRequest = URL(string: airportSvcEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        
        let session = URLSession.shared
        
        
        
        let task = session.dataTask(with: airportSvcEndpointRequest, completionHandler: { (data, response, error) in
            
            var airports: [Airport] = []
            
            guard error == nil else {
                print("error calling GET on /airports")
                print(error!)
                return
            }
            
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as?[String:Any] {
                for case let result in (json?["airports"] as? [[String: Any]])! {
                    if let airport = try? Airport(json: result) {
                        airports.append(airport!)
                    }
                }
            }else {
                print("Error: did not receive data")
                return
            }

            
            completionHandler(airports)
            
        });
        
        task.resume();
    }
}






