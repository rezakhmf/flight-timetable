//
//  Airpor+Crud.swift
//  Qantas
//
//  Created by Farahani, Reza(AWF) on 23/03/2017.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import Foundation
import CoreData

// MARK: - Airport managed object extension
extension AirportDAL {
    
    // MARK: - find all
    class func findAll() -> [Airport] {
        
        let fetchAirports:NSFetchRequest<AirportData> = AirportData.fetchRequest()
        
        do {
            
            let airportsFromDB = try AirportDAL.getContext().fetch(fetchAirports)
            var airports:[Airport] = []
            for airport in airportsFromDB {
                airports.append(Airport(
                    code: airport.code  ?? "n/a",
                    displayName: airport.display_name  ?? "n/a",
                    internationalAirport: airport.international_airport  ,
                    regionalAirport: airport.regional_airport  ,
                    location: (airport.latitude  , airport.longitude),
                    currencyCode: airport.currency_code  ?? "n/a",
                    timeZone: airport.timezone  ?? "n/a",
                    country: (airport.country_code  ?? "n/a", airport.country_display_name  ?? "n/a")
                )
                )
            }
            return airports
        }
        catch {
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        return []
    }
    
    // MARK: - find by code
    class func findByCode(mCode:String) -> [AirportData] {
        
        // check if there is no internet available
        //then read from core data
        //esle structure
        let airportPredicate = NSPredicate(format: "code == %@", mCode)
        
        
        let fetchAirports:NSFetchRequest<AirportData> = AirportData.fetchRequest()
        
        fetchAirports.predicate = airportPredicate
        
        do {
            let airportsFromDB = try AirportDAL.getContext().fetch(fetchAirports)
            return airportsFromDB
        }
        catch {
            let nserror = error as NSError
            print(nserror)
        }
        
        return []
        
    }
    // MARK: - insert single entry
    class func insert(mAirport:Airport) -> Airport{
        
        let airportData:AirportData = NSEntityDescription.insertNewObject(forEntityName: "AirportData", into: AirportDAL.getContext()) as! AirportData
        
        airportData.code = mAirport.code
        airportData.regional_airport = mAirport.regionalAirport
        airportData.international_airport = mAirport.internationalAirport
        airportData.country_code = mAirport.country.countryCode
        airportData.country_display_name = mAirport.country.countryName
        airportData.currency_code = mAirport.currencyCode
        airportData.latitude = mAirport.location.latitude
        airportData.longitude = mAirport.location.longitude
        airportData.timezone = mAirport.timeZone
    
        AirportDAL.saveContext()
        
        return mAirport
    }


    class func insertAll(mAirports:[Airport]) -> Int{
        
        let countOf = mAirports.count
        // MARK: - skip once first 10 records loaded on closure
        guard countOf > 11 else {
            //
            return 0
        }
        // MARK: - delete all as core data merge policy has significant memroy print
       _ =  self.deleteAll()
        var i:Int = 0
        for index in 0...mAirports.count-1 {
            
            //get AirportData description
            let entity =   NSEntityDescription.entity(forEntityName: "AirportData", in: AirportDAL.getContext())!
            
            //get peristence context
            let mmairport = NSManagedObject(entity: entity, insertInto: AirportDAL.getContext())
            
            mmairport.setValue(mAirports[index].code, forKeyPath: "code");
            mmairport.setValue(mAirports[index].displayName, forKeyPath: "display_name");
            mmairport.setValue(mAirports[index].regionalAirport, forKeyPath: "regional_airport");
            mmairport.setValue(mAirports[index].internationalAirport, forKeyPath: "international_airport");
            mmairport.setValue(mAirports[index].country.countryCode, forKeyPath: "country_code");
            mmairport.setValue(mAirports[index].country.countryName, forKeyPath: "country_display_name");
            mmairport.setValue(mAirports[index].currencyCode, forKeyPath: "currency_code");
            mmairport.setValue(mAirports[index].location.latitude, forKeyPath: "latitude");
            mmairport.setValue(mAirports[index].location.longitude, forKeyPath: "longitude")
            mmairport.setValue(mAirports[index].timeZone, forKeyPath: "timezone")
            
            i += 1
            
            if(i % 1000 == 0 ) {
                // MARK: - save insert context per 1000 records (less overhead on context)
                AirportDAL.saveContext()
                //print("insert " + String(i))
            }
        }
        // MARK: - save left over insert context
        AirportDAL.saveContext()
        return 0
    }
    
    class func deleteAll() -> Bool{
        
        
        let fetchAirports:NSFetchRequest<AirportData> = AirportData.fetchRequest()
        
        do {
            let airportsFromDB = try AirportDAL.getContext().fetch(fetchAirports)
            var i:Int = 0
            for result in airportsFromDB as [AirportData] {
                AirportDAL.getContext().delete(result)
                
                i += 1
                if(i % 1000 == 0 ) {
                    // print("deleted " + String(i))
                    AirportDAL.saveContext()
                }
                
            }
            // MARK: - save all delete context as delete doesnt make siginificat overhead
            AirportDAL.saveContext()
            
            return true
        }
        catch {
            print("Error")
        }
        
        return false
    }
    
    // MARK: - update
    class func update(){}
}
