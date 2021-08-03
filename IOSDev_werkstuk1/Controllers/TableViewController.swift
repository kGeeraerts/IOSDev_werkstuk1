//
//  TableViewController.swift
//  IOSDev_werkstuk1
//
//  Created by Quceka on 01/08/2021.
//  Copyright © 2021 Quceka. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{

    var Overijse: VacCent = VacCent(naam: "Vaccinatiecentrum Overijse",straat:  "Stationsplein",huisnummer: 1,postcode: 3080,gemeente: "Tervuren", lat: 50.77073,long: 4.53311,telefoonnummer: "+32496634304")
    var Heizel: VacCent = VacCent(naam: "Vaccinatiecentrum Heizel",straat:  "Keizerin Charlottelaan",huisnummer: 6,postcode: 1020,gemeente: "Brussel", lat: 50.89857,long: 4.3374,telefoonnummer: "+3222141919")
    var VacCents: [VacCent] = []
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Centra"
        
        if defaults.bool(forKey: "First Launch") != true {
            
            print("First Launch")
            
            VacCents.append(Overijse)
            VacCents.append(Heizel)
            
            defaults.set(true, forKey: "First Launch")
        }else{
            print("Not First Launch")
        }
        
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
    
    func getPicture(name: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent("\(name).png").path)
        }else {
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VacCent", for: indexPath) as? VacCentCell

        // Configure the cell
        
        cell?.name.text = self.VacCents[indexPath.row].naam
        cell?.address.text = "Adres: \(self.VacCents[indexPath.row].straat) \(self.VacCents[indexPath.row].huisnummer), \(self.VacCents[indexPath.row].postcode) \(self.VacCents[indexPath.row].gemeente)"
        cell?.telefoonnummer.text = "Telefoonnummer: \(self.VacCents[indexPath.row].telefoonnummer)"
        
        if self.VacCents[indexPath.row].saved {
            cell?.picture.image = getPicture(name: self.VacCents[indexPath.row].telefoonnummer)
        }else{
            cell?.picture.image = UIImage(named: "default.jpg")
        }
        
        return cell!
        
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            VacCents.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

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
        if segue.destination is ViewController{
            let destination = segue.destination as! ViewController
            destination.VacCents = self.VacCents
            
        }else if segue.destination is DetailViewController{
            
        }else if segue.destination is MapViewController{
            let destination = segue.destination as! MapViewController
            destination.VacCents = self.VacCents
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedVacCent = VacCents[indexPath.row]
        
        let destination = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        destination?.vacCent = selectedVacCent
        
        self.navigationController?.pushViewController(destination!, animated: true)
        
        //segue didn(t push the data, this solved the problem. Source: Pass data from tableView cell to another view controller Xcode 9.0 (Swift 4.0), Let Create An App
    }

}
