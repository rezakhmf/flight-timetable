//
//  AirportsTableTableViewController.swift
//  Qantas
//
//  Created by Reza Farahani on 19/3/17.
//  Copyright © 2017 Reza Farahani. All rights reserved.
//

import UIKit


protocol AirportsTableViewControllerDelegate {
    
    func getAirports(airports: [Airport])
}

class AirportsTableViewController: UITableViewController {
    //var delegate : AirportsTableViewControllerDelegate?
    
    
    let mvc = ViewController()
    
    var mAirport: [Airport] = [];
    
    var testArray:String = ""
    
    
    override func viewWillAppear(_ animated: Bool) {
        //  self.delegate?.getAirports(airports: [])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // self.mvc.delegate = self
        //self.tableView.delegate = self
      
         tableView.register(UINib(nibName: "AirportsTableViewCell", bundle: nil), forCellReuseIdentifier: "airportCell")
    }

    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.mAirport.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:AirportsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "airportCell", for: indexPath) as? AirportsTableViewCell)!
        
        cell.airportNameCode.text = self.mAirport[indexPath.row].displayName
        cell.airportTimeZone.text = self.mAirport[indexPath.row].code
        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 35
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 59
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let airportDetails:AirportDetails = AirportDetails()
        
        let airportCode:String = mAirport[indexPath.row].code
      
        airportDetails.mAirports = AirportDAL.findByCode(mCode: airportCode)
        
        
        self.present(airportDetails, animated: true, completion: nil)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
