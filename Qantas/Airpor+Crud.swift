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
    
        // check if there is no internet available
        //then read from core data
        //esle structure
        let airportPredicate = NSPredicate(format: "code == %@", mCode)
        
        
        let fetchAirports:NSFetchRequest<AirportData> = AirportData.fetchRequest()
        
        fetchAirports.predicate = airportPredicate
        
        do {
            let airportsFromDB = try AirportDAL.getContext().fetch(fetchAirports)
        
            //var mAirportArray:[AirportData] = []
            for result in airportsFromDB as [AirportData] {
                let resultCode = result.code
                // mAirportArray.append(result)
                // print(resultCode!)
//                if(resultCode == mCode){
//                   // return result
//                }
            }
            //var test = airportsFromDB as? [AirportData]
            //print(test?[0].code)
            return airportsFromDB//mAirportArray//airportsFromDB as [AirportData]
        }//TODO: create a exceptin
        catch {
            print("Error")
        }
        
        return []

    }
    
    class func insert(mAirport:Airport) -> Airport{
    
        var airportData:AirportData = NSEntityDescription.insertNewObject(forEntityName: "AirportData", into: AirportDAL.getContext()) as! AirportData
        
        
        
        
        airportData.code = mAirport.code
        airportData.regional_airport = mAirport.regionalAirport
        airportData.international_airport = mAirport.internationalAirport
        airportData.country_code = mAirport.country.countryCode
        airportData.display_name = mAirport.country.countryName
        airportData.currency_code = mAirport.currencyCode
        airportData.latitude = mAirport.location.latitude
        airportData.longitude = mAirport.location.longitude
        airportData.timezone = mAirport.timeZone
        
        
        do {
            // try (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            AirportDAL.saveContext()
            
           
            
            
        }catch {
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
        }
       
        return mAirport
    }
    
    class func insertAll(mAirports:[Airport]) -> Int{
        
        let countOf = mAirports.count
        guard countOf > 11 else {
            // Value requirements not met, do something
            return 0
        }
         self.deleteAll()
        
        // var insertedAirports:[Airport] = []
        var i:Int = 0
        for index in 0...mAirports.count-1 {
            
            
            let entity =   NSEntityDescription.entity(forEntityName: "AirportData", in: AirportDAL.getContext())!

            let mmairport = NSManagedObject(entity: entity, insertInto: AirportDAL.getContext())
            
            mmairport.setValue(mAirports[index].code, forKeyPath: "code");
            mmairport.setValue(mAirports[index].regionalAirport, forKeyPath: "regional_airport");
            mmairport.setValue(mAirports[index].internationalAirport, forKeyPath: "international_airport");
            mmairport.setValue(mAirports[index].country.countryCode, forKeyPath: "country_code");
            mmairport.setValue(mAirports[index].country.countryName, forKeyPath: "display_name");
            mmairport.setValue(mAirports[index].currencyCode, forKeyPath: "currency_code");
            mmairport.setValue(mAirports[index].location.latitude, forKeyPath: "latitude");
              mmairport.setValue(mAirports[index].location.longitude, forKeyPath: "longitude")
              mmairport.setValue(mAirports[index].timeZone, forKeyPath: "timezone")
            
            // let insertedAirport = self.insert(mAirport: mAirports[index])
            // let newEntityObject = NSEntityDescripation.insertNewObjectForEntityForName("AirportDAta", inManagedObjectContext: AirportDAL.getContext()) as! MyManagedObject
            
            //            newObject.attribute1 = item.whatever

            // insertedAirports.append(insertedAirport)
            i += 1
            
            // if(i % 100 == 0 ) {sleep(2)}
            if(i % 1000 == 0 ) {
                AirportDAL.saveContext()
                //print("saved...")
                print("insert " + String(i))
            }
        }
        
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
                 print("deleted " + String(i))
                    AirportDAL.saveContext()
                }
                
            }
            AirportDAL.saveContext()
            
            // sleep(2)
            return true
        }//TODO: create a exceptin
        catch {
           print("Error")
        }
        
        return false
    }
    
    
     class func update(){}
}
