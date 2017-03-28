//
//  AirportsTableViewCell.swift
//  Qantas
//
//  Created by Reza Farahani on 28/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import UIKit

class AirportsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var airportNameCode: UILabel!
    @IBOutlet weak var airportTimeZone: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
