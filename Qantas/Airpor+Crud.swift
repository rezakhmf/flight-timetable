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
    
    class func findByCode(mCode:String) -> [AirportData] {
    
        
        let airportPredicate = NSPredicate(format: "code == %@", mCode)
        
        
        let fetchAirports:NSFetchRequest<AirportData> = AirportData.fetchRequest()
        
        fetchAirports.predicate = airportPredicate
        
        do {
            let airportsFromDB = try AirportDAL.getContext().fetch(fetchAirports)
        
            var mAirportArray:[AirportData] = []
            for result in airportsFromDB as [AirportData] {
                let resultCode = result.code
                mAirportArray.append(result)
                print(resultCode)
//                if(resultCode == mCode){
//                   // return result
//                }
            }
            return mAirportArray//airportsFromDB as [AirportData]
        }//TODO: create a exceptin
        catch {
            print("Error")
        }
        
        return []

    }
    
    class func insert(mAirport:Airport) -> Airport{
    
        let airportData:AirportData = NSEntityDescription.insertNewObject(forEntityName: "AirportData", into: AirportDAL.getContext()) as! AirportData
        
        airportData.code = mAirport.code
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
    
    class func deleteAll() -> Bool{
        
        let fetchAirports:NSFetchRequest<AirportData> = AirportData.fetchRequest()
        
        do {
            let airportsFromDB = try AirportDAL.getContext().fetch(fetchAirports)
            for result in airportsFromDB as [AirportData] {
                AirportDAL.getContext().delete(result)
                AirportDAL.saveContext()
            }
            return true
        }//TODO: create a exceptin
        catch {
           print("Error")
        }
        
        return false
    }
    
    
     class func update(){}
}
