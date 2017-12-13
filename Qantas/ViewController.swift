//
//  ViewController.swift
//  Qantas
//
//  Created by Reza Farahani on 28/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import UIKit
import CoreData



class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(Utils.isInternetAvailable()){
            // MARK: - background queue
            let readAirportQueue = DispatchQueue(label: "au.com.qantas.airports.read", qos: .background)
            
            let readAirpotsWorkItem = DispatchWorkItem {
                Airport.airports(matching: "https://www.qantas.com.au/api/airports"){ airports in
                    // MARK: - algorithm
                    //pish first 10 airports from api call
                    //use structure to pass by value instead of referecnce to
                    //avoid ARC interception
                    if (airports.count < 11)  {
                        // MARK: - main queue to serve transition
                        DispatchQueue.main.sync {
                            let secondViewController:AirportsTableViewController = AirportsTableViewController()
                            secondViewController.mAirport = airports
                            self.present(secondViewController, animated: true, completion: nil)
                        }
                    } else {
                        _ = AirportDAL.insertAll(mAirports: airports)
                    }
                }
                
            }
            
            readAirportQueue.async(execute: readAirpotsWorkItem)

        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // MARK: - offline mode
        if(!Utils.isInternetAvailable()){

        let secondViewController:AirportsTableViewController = AirportsTableViewController()
        secondViewController.mAirport = AirportDAL.findAll()
        self.present(secondViewController, animated: true, completion: nil)
        }

    }
    
    
    
}

