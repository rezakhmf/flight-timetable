//
//  AiportBizExt.swift
//  Qantas
//
//  Created by Reza Farahani on 14/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import Foundation

extension Airport {
    
    
    // MARK: - get all aiports
    static func airports(matching query: String, completionHandler: @escaping (([Airport]) -> Void)) {
        
        let airportSvcEndpoint: String = query
        // MARK: - api url to retrive airports
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
            
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                let airportsJson = json["airports"] as? [[String: Any]] ?? []
                for case let item in airportsJson {
                    if let airport = try? Airport(json: item) {
                        airports.append(airport!)
                        if(airports.count == 10 ){
                             completionHandler(airports)
                        }
                    }
                }
            } catch let error as NSError {
                print(error)
            }
            
            completionHandler(airports)
            
        });
        task.resume();
    }
}






