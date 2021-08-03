//
//  VacCent.swift
//  IOSDev_werkstuk1
//
//  Created by Quceka on 02/08/2021.
//  Copyright © 2021 Quceka. All rights reserved.
//

import UIKit

class VacCent: NSObject {
    var naam: String
    var straat: String
    var huisnummer: Int
    var postcode: Int
    var gemeente: String
    var lat: Double
    var long: Double
    var telefoonnummer: String //String in case people add "+" to number
    var saved: Bool
    
    init(naam: String, straat: String, huisnummer: Int, postcode: Int, gemeente: String, lat: Double, long: Double, telefoonnummer: String){
        self.naam = naam
        self.straat = straat
        self.huisnummer = huisnummer
        self.postcode = postcode
        self.gemeente = gemeente
        self.lat = lat
        self.long = long
        self.telefoonnummer = telefoonnummer
        self.saved = false
    }
    
    init(naam: String, straat: String, huisnummer: Int, postcode: Int, gemeente: String, lat: Double, long: Double, telefoonnummer: String, saved: Bool){
        self.naam = naam
        self.straat = straat
        self.huisnummer = huisnummer
        self.postcode = postcode
        self.gemeente = gemeente
        self.lat = lat
        self.long = long
        self.telefoonnummer = telefoonnummer
        self.saved = saved
    }
    func description() -> String {
        return "Nummer: \(telefoonnummer), Adres: \(straat) \(huisnummer), \(postcode) \(gemeente)"
    }
}
