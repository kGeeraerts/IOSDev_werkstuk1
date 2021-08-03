//
//  DetailViewController.swift
//  IOSDev_werkstuk1
//
//  Created by Quceka on 02/08/2021.
//  Copyright © 2021 Quceka. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, MKMapViewDelegate {
    
    var vacCent: VacCent?
    let annotation = MKPointAnnotation()
    
    @IBOutlet weak var Naam: UILabel!
    @IBOutlet weak var Adres: UILabel!
    @IBOutlet weak var Telefoonnummer: UILabel!
    @IBOutlet weak var GPS: UILabel!
    @IBOutlet weak var Foto: UIImageView!
    @IBOutlet weak var mapLocation: MKMapView!
    
    func getPicture(name: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent("\(name).png").path)
        }else {
            return nil
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Naam.text = vacCent!.naam
        Adres.text = "Adres: \(vacCent!.straat) \(vacCent!.huisnummer), \(vacCent!.postcode) \(vacCent!.gemeente)"
        Telefoonnummer.text = "Telefoonnummer: \(vacCent!.telefoonnummer)"
        GPS.text = "Latitude: \(vacCent!.lat), Longitude: \(vacCent!.long)"
        if vacCent!.saved {
            Foto.image = getPicture(name: vacCent!.telefoonnummer)
        }else{
            Foto.image = UIImage(named: "default.jpg")
        }
        
        let vacCentLocation = CLLocationCoordinate2D(latitude: Double(vacCent!.lat), longitude: Double(vacCent!.long))
        let radius: CLLocationDistance = 500.0
        let location = MKCoordinateRegion(center: vacCentLocation, latitudinalMeters: radius, longitudinalMeters: radius)
        annotation.coordinate = CLLocationCoordinate2D(latitude: vacCent!.lat, longitude: vacCent!.long)
        
        mapLocation.addAnnotation(annotation)
        mapLocation.setRegion(location, animated: true)
        mapLocation.delegate = self
        
    }
    
    
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ImageViewController
        destination.location = self.vacCent!.telefoonnummer
        destination.saved = self.vacCent!.saved
    }
}
