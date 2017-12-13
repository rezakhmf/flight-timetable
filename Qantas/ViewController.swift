//
//  ViewController.swift
//  Qantas
//
//  Created by Reza Farahani on 13/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import UIKit
import CoreData



class ViewController: UIViewController, AirportsTableViewControllerDelegate {
    
    var delegate:AirportsTableViewControllerDelegate?
    
    
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // AirportDAL.deleteAll()
        
        let readAirportQueue = DispatchQueue(label: "au.com.qantas.airports.read", qos: .background)
        
        
        let readAirpotsWorkItem = DispatchWorkItem {
            Airport.airports(matching: "https://www.qantas.com.au/api/airports"){ airports in
                
                if (airports.count < 11)  {
                    print(airports.count)
                    DispatchQueue.main.sync {
                        let secondViewController:AirportsTableViewController = AirportsTableViewController()
                        
                        secondViewController.mAirport = airports
                        
                        self.present(secondViewController, animated: true, completion: nil)
                        // _ = AirportDAL.insertAll(mAirports: airports)
                    }
                } else {
                    print(airports.count)
                    //should put back in created thread
                    //do upsert
                    //  while(AirportDAL.deleteAll()){
                    //upsert
                    // print(airports)
                        //     break
                        // }
                    
                }
                
               
                //AirportDAL.deleteAll()
                    _ = AirportDAL.insertAll(mAirports: airports)
                
            }
        
        }
        
         readAirportQueue.async(execute: readAirpotsWorkItem)
        // let readAirpotsWorkItem = DispatchWorkItem {
        // }
        //readAirpotsWorkItem.notify(queue: readAirportQueue, execute: //)
    }
    
    
    func getAirports(airports: [Airport]) {
        print("yay deleagte")
    }
    
    
}

