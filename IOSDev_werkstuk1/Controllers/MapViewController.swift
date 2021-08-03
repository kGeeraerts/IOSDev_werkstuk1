//
//  MapViewController.swift
//  IOSDev_werkstuk1
//
//  Created by Quceka on 01/08/2021.
//  Copyright © 2021 Quceka. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var regionVacCents: MKMapView!
    
    var VacCents:[VacCent] = []
    var userLocation: CLLocationManager!
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let curUserLocation:CLLocation = locations[0] as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: curUserLocation.coordinate.latitude, longitude: curUserLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000.0, longitudinalMeters: 1000.0)
        
        regionVacCents.setRegion(region, animated: true)
        
        let annotation: MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(curUserLocation.coordinate.latitude, curUserLocation.coordinate.longitude)
        regionVacCents.addAnnotation(annotation)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if VacCents.isEmpty {
            print("empty")
        }else{
            for vac in VacCents {
                print(vac.naam)
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: vac.lat, longitude: vac.long)
                regionVacCents.addAnnotation(annotation)
            }
        }
        title = "Centra rond mij"
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        
    }
    

    // MARK: - Navigation

}
