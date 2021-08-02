//
//  ViewController.swift
//  IOSDev_werkstuk1
//
//  Created by Quceka on 31/07/2021.
//  Copyright © 2021 Quceka. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var VacCents: [VacCent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Voeg vaccinatiecentrum toe"
        // Do any additional setup after loading the view.
        
        if VacCents.isEmpty {
            print("empty")
        }else{
            for vac in VacCents {
                print(vac.naam)
            }
        }
    }
    
    @IBOutlet weak var naam: UITextField!
    @IBOutlet weak var straat: UITextField!
    @IBOutlet weak var huisnummer: UITextField!
    @IBOutlet weak var gemeente: UITextField!
    @IBOutlet weak var Postcode: UITextField!
    @IBOutlet weak var telefoonnummer: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    
    @IBAction func addVacCent(_ sender: UIButton) {
        
        if self.naam.text != nil, self.straat.text != nil, self.huisnummer.text != nil, self.gemeente.text != nil, self.Postcode.text != nil, self.telefoonnummer.text != nil, self.latitude != nil, self.longitude.text != nil {
            
            let newVacCent = VacCent(naam: self.naam.text! ,straat:  self.straat.text! ,huisnummer: Int(self.huisnummer.text!)! ,postcode: Int(self.Postcode.text!)!,gemeente: self.gemeente.text!, lat: Double(self.latitude.text!)!,long: Double(self.longitude.text!)!,telefoonnummer: self.telefoonnummer.text!)
            VacCents.append(newVacCent)
            
        }
        
        let Tervuren: VacCent = VacCent(naam: "Vaccinatiecentrum Tervuren",straat:  "Stationsplein",huisnummer: 1,postcode: 3080,gemeente: "Tervuren", lat: 50.77073,long: 4.53311,telefoonnummer: "Unknown")
        VacCents.append(Tervuren)
        
        print("New VacCent added")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! TableViewController
        destination.VacCents = self.VacCents
    }
    


}

