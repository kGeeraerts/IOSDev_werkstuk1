//
//  DetailViewController.swift
//  IOSDev_werkstuk1
//
//  Created by Quceka on 02/08/2021.
//  Copyright © 2021 Quceka. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var vacCent: VacCent?
    
    @IBOutlet weak var Naam: UILabel!
    @IBOutlet weak var Adres: UILabel!
    @IBOutlet weak var Telefoonnummer: UILabel!
    @IBOutlet weak var GPS: UILabel!
    @IBOutlet weak var Foto: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Naam.text = vacCent!.naam
        Adres.text = "Adres: \(vacCent!.straat) \(vacCent!.huisnummer), \(vacCent!.postcode) \(vacCent!.gemeente)"
        Telefoonnummer.text = "Telefoonnummer: \(vacCent!.telefoonnummer)"
        GPS.text = "Latitude: \(vacCent!.lat), Longitude: \(vacCent!.long)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
