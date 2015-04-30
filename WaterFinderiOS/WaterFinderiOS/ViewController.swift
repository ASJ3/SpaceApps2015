//
//  ViewController.swift
//  WaterFinderiOS
//
//  Created by Alexis Saint-Jean on 4/30/15.
//  Copyright (c) 2015 Alexis Saint-Jean. All rights reserved.
//


import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func recenterMap(sender: AnyObject) {
        centerMapOnLocation(CLLocation(latitude: 0.261211, longitude: 32.535113))
    }
    @IBAction func changeMapType(sender: AnyObject) {
        if mapView.mapType == MKMapType.Standard {
            mapView.mapType = MKMapType.Hybrid
        } else {
            mapView.mapType = MKMapType.Standard
        }
    }
    
    var locationManager: CLLocationManager?
    
    
    // Code to specify the zoom level of the map
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation (location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 20.0, regionRadius * 20.0)
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
        self.locationManager = CLLocationManager()
        self.locationManager?.requestWhenInUseAuthorization()
        self.locationManager?.delegate = self
        
        
        // Hard code the initial location for now
        let initialLocation = CLLocation(latitude: 0.261211, longitude: 32.535113)
        centerMapOnLocation(initialLocation)
        
        
        // Commnenting out for now, as it is difficult to test location servives on the simulator: it works when I run the app from Xcode, but if I stop the app and launch it again from the simulator, then it seems there is no default location and so the app doesn't work.
        // Ideally, I want to use the locationManager to show a blue translucent ball indicating the user current location (or the simulated location in the iOS simulator)
        //        mapView.showsUserLocation = true
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


