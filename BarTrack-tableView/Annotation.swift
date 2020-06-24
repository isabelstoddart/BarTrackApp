//
//  Annotation.swift
//  BarTrack-tableView
//
//  Created by Cara Nielson on 5/2/18.
//  Copyright © 2018 Cara Nielson. All rights reserved.
//

import Foundation

import MapKit

class Annotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    
    let title: String?
    let locationName: String
    
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
