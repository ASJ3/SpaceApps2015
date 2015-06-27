//
//  WaterSource.swift
//  MapSample
//
//  Created by Alexis Saint-Jean on 6/7/15.
//  Copyright (c) 2015 Alexis Saint-Jean. All rights reserved.
//

import Foundation
import MapKit

class WaterSource: NSObject, MKAnnotation {
    
    let title: String
    let info: String
    let coordinate: CLLocationCoordinate2D
    let beneficiaries: String
    let donor: String
    let completed: String
    
    init(title:String, info:String, beneficiaries:String, donor:String, completed:String, coordinate: CLLocationCoordinate2D) {
        
        self.title = title
        self.info = info
        self.coordinate = coordinate
        self.beneficiaries = beneficiaries
        self.donor = donor
        self.completed = completed
        
        super.init()
    }
    
    var subtitle: String {
        return self.info
    }
    
    //    class func returnLocationInfo(individualLocation: Dictionary) -> WaterSource? {
    //        let title = individualLocation.title
    //        let latitude = individualLocation.latitude
    //        let longitude = individualLocation.longitude
    //
    //        return WaterSource(coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
    //    }
    
}
