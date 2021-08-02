//
//  TableViewController.swift
//  IOSDev_werkstuk1
//
//  Created by Quceka on 01/08/2021.
//  Copyright © 2021 Quceka. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var Centratemp = ["Vaccinatiecentrum Overijse", "Vaccinatiecentrum Tervuren"]
    
    var desc = ["Vaccinatiecentrum van Overijse", "Vaccinatiecentrum van Tervuren"]

    var VacCents: [VacCent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Centra"

        let Overijse: VacCent = VacCent(naam: "Vaccinatiecentrum Overijse",straat:  "Stationsplein",huisnummer: 1,postcode: 3090,gemeente: "Overijse", lat: 50.77073,long: 4.53311,telefoonnummer: "Unknown")
        VacCents.append(Overijse)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return VacCents.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VacCent", for: indexPath)

        // Configure the cell
        
        cell.textLabel?.text = self.VacCents[indexPath.row].naam
        cell.detailTextLabel?.text = self.VacCents[indexPath.row].description()

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        destination.VacCents = self.VacCents
    }

}
