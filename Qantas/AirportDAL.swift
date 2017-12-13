//
//  Airport+DAL.swift
//  Qantas
//
//  Created by Reza Farahani on 18/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import Foundation
import CoreData

class AirportDAL {
    
    private init() {
        
    }
    
    class func getContext() -> NSManagedObjectContext {
  
        return self.persistentContainer.viewContext
    }
    
    
    // MARK: - Core Data stack
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "QantasDB")
    
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    class func saveContext () {
        let context = self.getContext()
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                  let nserror = error as NSError
                  print(nserror)
            }
        }
    }
    
    
  
}
