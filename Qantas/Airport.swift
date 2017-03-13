//
//  Airport.swift
//  Qantas
//
//  Created by Reza Farahani on 13/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import Foundation

struct Airport{

    let code: String
    let displayName: String
    let internationalAirport: Bool
    let regionalAirport: Bool
    let location: (latitude: Double, longitude: Double)
    let currencyCode: String
    let timeZone: String
    let country: (countryCode: String, countryName: String)
}
