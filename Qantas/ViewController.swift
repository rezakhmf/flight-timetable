//
//  ViewController.swift
//  Qantas
//
//  Created by Reza Farahani on 13/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let airportData:AirportData = NSEntityDescription.insertNewObject(forEntityName: "AirportData", into: AirportDAL.persistentContainer.viewContext) as! AirportData
        
        airportData.display_name = "beth"

        AirportDAL.saveContext();
        
        let fetchAirports:NSFetchRequest<AirportData> = AirportData.fetchRequest()
        
        do {
            let airportsFromDB = try AirportDAL.getContext().fetch(fetchAirports)
            print("number of result: \(airportsFromDB.count)")
            
            for result in airportsFromDB as [AirportData] {
                print("\(result.display_name!)")
            }
        } catch {
            print("Error")
        }
        
//        Airport.airports(matching: "https://www.qantas.com.au/api/airports"){ airports in
//            print(airports)
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

