//
//  Airpor+Crud.swift
//  Qantas
//
//  Created by Farahani, Reza(AWF) on 23/03/2017.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import Foundation
import CoreData

extension AirportDAL {

    class func findAll() -> [AirportData] {
        
        let fetchAirports:NSFetchRequest<AirportData> = AirportData.fetchRequest()
        do {
            let airportsFromDB = try AirportDAL.getContext().fetch(fetchAirports)
            return airportsFromDB
        }
            //TODO: create a exceptin
        catch {
            print("Error")
        }
    return []
    }
    
    class func findByCode(mCode:String) -> AirportData {
    
        let fetchAirports:NSFetchRequest<AirportData> = AirportData.fetchRequest()
        
        do {
            let airportsFromDB = try AirportDAL.getContext().fetch(fetchAirports)
            print("number of result: \(airportsFromDB.count)")
            
            for result in airportsFromDB as [AirportData] {
                if(result.code == mCode){
                    return result
                }
            }
        }//TODO: create a exceptin
        catch {
            print("Error")
        }
        
        return AirportData()

    }
    
    class func insert(mAirport:Airport) -> Airport{
    
        let airportData:AirportData = NSEntityDescription.insertNewObject(forEntityName: "AirportData", into: AirportDAL.persistentContainer.viewContext) as! AirportData
        
        airportData.display_name = mAirport.code
        airportData.regional_airport = mAirport.regionalAirport
        airportData.international_airport = mAirport.internationalAirport
        airportData.country_code = mAirport.country.countryCode
        airportData.display_name = mAirport.country.countryName
        airportData.currency_code = mAirport.currencyCode
        airportData.latitude = mAirport.location.latitude
        airportData.longitude = mAirport.location.longitude
        airportData.display_name = mAirport.timeZone
        
        AirportDAL.saveContext();
        
        return mAirport
    }
    
    class func insertAll(mAirports:[Airport]) -> Int{
    
        var insertedAirports:[Airport] = []
        
        for index in 0...mAirports.count-1 {
           let insertedAirport = self.insert(mAirport: mAirports[index])
            insertedAirports.append(insertedAirport)
        }
        return mAirports.count
    }
    
    class func deleteAll(){
        
        let fetchAirports:NSFetchRequest<AirportData> = AirportData.fetchRequest()
        
        do {
            let airportsFromDB = try AirportDAL.getContext().fetch(fetchAirports)
            print("number of result: \(airportsFromDB.count)")
            
            for result in airportsFromDB as [AirportData] {
                print("\(result.display_name!)")
                result.managedObjectContext?.delete(result)
                AirportDAL.saveContext()
            }
        }//TODO: create a exceptin
        catch {
           print("Error")
        }
    }
    
    
     class func update(){}
}
