//
//  AirportDetails.swift
//  Qantas
//
//  Created by Farahani, Reza(AWF) on 23/03/2017.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import UIKit

class AirportDetails: ViewController {
    
    
    @IBOutlet weak var airportName: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var internationalFlag: UISwitch!
    @IBOutlet weak var regionalFlag: UISwitch!
    @IBOutlet weak var currency: UILabel!
    var mAirports:[AirportData] = []
    

    @IBOutlet weak var meme: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - fill page outlets 
         currency.text = mAirports[0].currency_code!
        country.text = mAirports[0].timezone!
        internationalFlag.setOn(mAirports[0].international_airport, animated: true)
        regionalFlag.setOn(mAirports[0].regional_airport, animated: true)
       currency.text = mAirports[0].currency_code!
      
    }

}
