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
        
        let readAirportQueue = DispatchQueue(label: "au.com.qantas.airports.read", qos: .userInitiated)
        
        let readAirpotsWorkItem = DispatchWorkItem {
            Airport.airports(matching: "https://www.qantas.com.au/api/airports"){ airports in
                
                if (airports.count < 11)  {
                    
                    DispatchQueue.main.sync {
                        let secondViewController:AirportsTableViewController = AirportsTableViewController()
                        
                        secondViewController.mAirport = airports
                        
                        self.present(secondViewController, animated: true, completion: nil)
                    }
                } else {
                    while(AirportDAL.deleteAll()){
                        _ = AirportDAL.insertAll(mAirports: airports)
                        break
                    }
                }
                
            }
        }
        
        readAirportQueue.async(execute: readAirpotsWorkItem)
    }
    
    
    func getAirports(airports: [Airport]) {
        print("yay deleagte")
    }
    
    
}

