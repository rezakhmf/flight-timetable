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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        airportName.text = mAirports[0].code
        country.text = mAirports[0].timezone
        internationalFlag.setOn(mAirports[0].international_airport, animated: false)
        regionalFlag.setOn(mAirports[0].regional_airport, animated: false)
        currency.text = mAirports[0].currency_code
        // Do any additional setup after loading the view.
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
