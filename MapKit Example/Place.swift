//
//  Place.swift
//  MapKit Example
//
//  Created by Aziza Kamet on 15.11.16.
//  Copyright © 2016 Aziza Kamet. All rights reserved.
//

import UIKit
import MapKit

class Place: NSObject, MKAnnotation {

    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
}
