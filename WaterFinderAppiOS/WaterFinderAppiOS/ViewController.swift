//
//  ViewController.swift
//  WaterFinderAppiOS
//
//  Created by Alexis Saint-Jean on 4/19/15.
//  Copyright (c) 2015 Alexis Saint-Jean. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    // Code to specify the zoom level of the map
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation (location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 10.0, regionRadius * 10.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    //Development Notes:
    //Will need to use Parse to store data from users
    //What to do when no GPS connection
    //Use pop for animation
    //Create protocol in ViewController to capture data sent by the OptionsViewController and update the view on the map accordingly (i.e. what water sources to show etc)
    //Embed a navigation Controller 
    //Store data locally using coreData

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Hard code the initial location for now
        let initialLocation = CLLocation(latitude: 0.261211, longitude: 32.535113)
        
        centerMapOnLocation(initialLocation)

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

