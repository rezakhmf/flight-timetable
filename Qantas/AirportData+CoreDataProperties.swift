//
//  AirportData+CoreDataProperties.swift
//  Qantas
//
//  Created by Reza Farahani on 18/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import Foundation
import CoreData


extension AirportData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AirportData> {
        return NSFetchRequest<AirportData>(entityName: "AirportData");
    }

    @NSManaged public var code: String?
    @NSManaged public var display_name: String?
    @NSManaged public var international_airport: Bool
    @NSManaged public var regional_airport: Bool
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var currency_code: String?
    @NSManaged public var timezone: String?
    @NSManaged public var country_display_name: String?
    @NSManaged public var country_code: String?

}
