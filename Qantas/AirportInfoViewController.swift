//
//  AirportInfoViewController.swift
//  Qantas
//
//  Created by Reza Farahani on 28/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import UIKit

class AirportInfoViewController: UIViewController {

    
    @IBOutlet weak var displayName: UILabel!
    
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var International: UILabel!
    
    @IBOutlet weak var regional: UILabel!
    
    
    @IBOutlet weak var timeZone: UILabel!
    
    var mAirports:[AirportData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.displayName.text = mAirports[0].display_name
        self.countryName.text = mAirports[0].country_display_name
        self.International.text = mAirports[0].international_airport ? "yes" : "no"
        self.regional.text = mAirports[0].regional_airport  ? "yes" : "no"
        self.timeZone.text = mAirports[0].timezone
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
