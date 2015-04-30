//
//  WaterSource.swift
//  WaterFinderiOS
//
//  Created by Alexis Saint-Jean on 4/30/15.
//  Copyright (c) 2015 Alexis Saint-Jean. All rights reserved.
//

import Foundation
import MapKit

class WaterSource: NSObject, MKAnnotation {


let coordinate: CLLocationCoordinate2D

    init(coordinate: CLLocationCoordinate2D) {

        self.coordinate = coordinate
        
        super.init()
    }
    
//    class func returnLocationInfo(individualLocation: Dictionary) -> WaterSource? {
//        let title = individualLocation.title
//        let latitude = individualLocation.latitude
//        let longitude = individualLocation.longitude
//        
//        return WaterSource(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
//    }

}
