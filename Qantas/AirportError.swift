//
//  AirportError.swift
//  Qantas
//
//  Created by Reza Farahani on 13/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import Foundation

enum SerializationAirportError: Error {
    
    case missing(String)
    case invalid(String, Any)
}
