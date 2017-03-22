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
        print("secon vc")
        
        print(testArray)
        print(mAirport)
        
        // self.mvc.delegate = self
        //self.tableView.delegate = self
      
         tableView.register(UINib(nibName: "AirportsTableViewCell", bundle: nil), forCellReuseIdentifier: "airportCell")
    }

    
    
    func getAirports(airports: [Airport]) {
        
        // self.mAirport = airports
        // self.tableView.reloadData()
        print("yay delegate")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10//self.mAirport.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:AirportsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "airportCell", for: indexPath) as? AirportsTableViewCell)!
        
        cell.airportNameCode.text = "test"//self.mAirport[indexPath.row].code  //"test"
        cell.airportTimeZone.text = "test"//self.mAirport[indexPath.row].code  //"test1"
        // print("cellliii")
        return cell
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
