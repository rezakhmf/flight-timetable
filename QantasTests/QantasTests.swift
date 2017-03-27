//
//  QantasTests.swift
//  QantasTests
//
//  Created by Reza Farahani on 13/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import XCTest
@testable import Qantas

class QantasTests: XCTestCase {
    
    
    var airports: [Airport] = []

 
    
    override func setUp() {
        super.setUp()
        
           let airportsFromApi:String = "{\"airports\":[{\"code\":\"BZD\",\"display_name\":\"Balranald\",\"international_airport\":false,\"regional_airport\":false,\"location\":{\"latitude\":-34.616665,\"longitude\":143.61667},\"currency_code\":\"AUD\",\"timezone\":\"Australia/Sydney\",\"country\":{\"code\":\"AU\",\"display_name\":\"Australia\"}}]}";
        do{
            let data: NSData = airportsFromApi.data(using: String.Encoding.utf8)! as NSData
            let json = try JSONSerialization.jsonObject(with: data as Data) as? [String: Any]
            let airportsJson = json?["airports"] as? [[String: Any]] ?? []
            
            for case let item in airportsJson {
                if let airport = try? Airport(json: item) {
                    airports.append(airport!)
                }
            }
            
        } catch {
            
        }
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    

    func testInitAirportsTableView() {
    
        let airportsTV = AirportsTableViewController()
        _ = airportsTV.view
        XCTAssertNotNil(airportsTV)
    }
    
    func testAirportStructInit() {
        
        XCTAssertEqual(airports.count, 1)
        
        XCTAssertTrue(airports[0].code == "BZD")
        XCTAssertTrue(airports[0].currencyCode == "AUD")
        XCTAssertTrue(airports[0].displayName == "Balranald")
        XCTAssertTrue(airports[0].internationalAirport == false)
        XCTAssertTrue(airports[0].regionalAirport == false)
        XCTAssertTrue(airports[0].timeZone == "Australia/Sydney")
    
    }
    
    func testOtherScenarios(){
        //there are more scenarios that could have here
        //but 3 hrs is not enough time to cover all
    }
    
}
