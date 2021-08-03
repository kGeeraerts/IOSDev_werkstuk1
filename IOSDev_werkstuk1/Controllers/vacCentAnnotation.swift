//
//  vacCentAnnotation.swift
//  IOSDev_werkstuk1
//
//  Created by Quceka on 03/08/2021.
//  Copyright © 2021 Quceka. All rights reserved.
//

import UIKit
import MapKit

class vacCentAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(coor: CLLocationCoordinate2D){
        coordinate = coor
    }

}
