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
    
    var mAirports:[Airport] = [];
    
    func getAirports(airports: [Airport]) {
        print("yay deleagte")
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
        super.viewDidAppear(animated)
        
        
        
       
        
        //if(mAirports.)
        print("view did apear")
        
        // print(mAirports.count)
       
        
        //print("reza")
//        
        let secondViewController:AirportsTableViewController = AirportsTableViewController()
        
        secondViewController.testArray = "amir mamad"

        self.present(secondViewController, animated: true, completion: nil)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
         self.delegate?.getAirports(airports:[])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
         print("view did load")
        
        let readAirportQueue = DispatchQueue(label: "au.com.qantas.airports.read", qos: .userInitiated)
        
        let readAirpotsWorkItem = DispatchWorkItem {
            Airport.airports(matching: "https://www.qantas.com.au/api/airports"){ airports in
                
                
                
                // self.transier()
                print("call delegate")
                self.mAirports = airports
                DispatchQueue.main.sync {
                    print("hi...")
                    self.delegate?.getAirports(airports:airports)
//                     self.performSegue(withIdentifier: "aiportsSegue", sender: nil)
                    
                    
                    let secondViewController:AirportsTableViewController = AirportsTableViewController()
                    
                    secondViewController.testArray = "amir mamad"
                    secondViewController.mAirport = airports
                    
                    self.present(secondViewController, animated: true, completion: nil)
                    
                    print("bye...")
//                            let secondViewController:AirportsTableViewController = AirportsTableViewController()
//                    
//                            self.present(secondViewController, animated: true, completion: nil)
                    // self.viewDidAppear(true)
                }
                print(airports.count)
            }
        }
        
        readAirportQueue.async(execute: readAirpotsWorkItem)
        
        
//        let secondViewController:AirportsTableViewController = AirportsTableViewController()
//        
//        self.present(secondViewController, animated: true, completion: nil)
//        
        
        
//        
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "airportTblVC") as! AirportsTableViewController
//        self.present(nextViewController, animated:true, completion:nil)

        
        
//        let airportData:AirportData = NSEntityDescription.insertNewObject(forEntityName: "AirportData", into: AirportDAL.persistentContainer.viewContext) as! AirportData
//        
//        airportData.display_name = "beth"
//        
//
//        AirportDAL.saveContext();
//    
//        
//        let fetchAirports:NSFetchRequest<AirportData> = AirportData.fetchRequest()
//        
//        do {
//            let airportsFromDB = try AirportDAL.getContext().fetch(fetchAirports)
//            print("number of result: \(airportsFromDB.count)")
//            
//            for result in airportsFromDB as [AirportData] {
//                print("\(result.display_name!)")
//                // result.managedObjectContext?.delete(result)
//                // AirportDAL.saveContext()
//                
//            }
//        } catch {
//            print("Error")
//        }

        
        
//        let readAirportQueue = DispatchQueue(label: "au.com.qantas.airports.read", qos: .userInitiated)
//        
//        let readAirpotsWorkItem = DispatchWorkItem {
//            Airport.airports(matching: "https://www.qantas.com.au/api/airports"){ airports in
//            
//                self.delegate?.getAirports(airports:airports)
//                
//                let secondViewController:AirportsTableViewController = AirportsTableViewController()
//                
//                self.present(secondViewController, animated: true, completion: nil)
//                print(airports.count)
//            }
//        }
//        
//        readAirportQueue.async(execute: readAirpotsWorkItem)
//        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

