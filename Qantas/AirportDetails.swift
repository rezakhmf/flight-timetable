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
        //let jj = self.view
        //orce the VC to load its view hierarchy by saying
        
         currency.text = mAirports[0].currency_code!
        country.text = mAirports[0].timezone!
        internationalFlag.setOn(mAirports[0].international_airport, animated: true)
        regionalFlag.setOn(mAirports[0].regional_airport, animated: true)
         currency.text = mAirports[0].currency_code!
        // Do any additional setup after loading the view.
      
    }


    override func viewWillAppear(_ animated: Bool) {
        //  let airportNameC:String = mAirports[0].code!
        //  airportName.text = airportNameC
        // let view = self.view;
        //meme.text = "reza"
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
