//
//  LocMapViewController.swift
//  MapSample
//
//  Created by Alexis Saint-Jean on 5/31/15.
//  Copyright (c) 2015 Alexis Saint-Jean. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class LocMapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var locationUpdateInfoLabel: UILabel!
    let locationManager = CLLocationManager()
    // Array that will hold the info of nearby water sources
    var waterSources = [WaterSource]()
    
    var loopChanges = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Start of viewDidLoad")

        //Set up our Location Manager
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        //Set up our Map View
        self.map.delegate = self
        self.map.showsUserLocation = true
        
        //Building pins from locations saved in the Locations plist
        var waterLocationsPath = NSBundle.mainBundle().pathForResource("Locations", ofType: "plist")
        var waterLocationsInfo = NSMutableArray(contentsOfFile: waterLocationsPath!)
        
        for i in 0..<waterLocationsInfo!.count {
            var title = waterLocationsInfo![i]["name"]! as! String
            var info = waterLocationsInfo![i]["info"]! as! String
            var waterLatitude = waterLocationsInfo![i]["latitude"]! as! Double
            var waterLongitude = waterLocationsInfo![i]["longitude"]! as! Double
            var beneficiaries = waterLocationsInfo![i]["beneficiaries"] as! String
            var donor = waterLocationsInfo![i]["donor"] as! String
            var completed = waterLocationsInfo![i]["completed"] as! String
            var waterLocation = WaterSource(title: title, info: info, beneficiaries:beneficiaries, donor:donor, completed:completed, coordinate: CLLocationCoordinate2D(latitude: waterLatitude, longitude: waterLongitude))
            self.waterSources.append(waterLocation)
        }
        
//        let waterLocation0 = WaterSource(coordinate: CLLocationCoordinate2D(latitude: 39.078850, longitude: -77.150728))
//        self.waterSources.append(waterLocation0)
       
        self.map.addAnnotations(self.waterSources)
        
        println("End of viewDidLoad")
    }
    

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        loopChanges += 1
        println("Identified a change in current location \(loopChanges)")
        
        let location = locations.last as! CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.map.setRegion(region, animated: true)
    }
    

    //Function to show some info about each water source on the map
    //Code from function inspired by http://www.raywenderlich.com/90971/introduction-mapkit-swift-tutorial
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if let annotation = annotation as? WaterSource {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView {
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            }
            else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIView
            }
            return view
        }
        return nil
    }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        
                    if control == view.rightCalloutAccessoryView {
                        let location = view.annotation as! WaterSource
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                        let wellDetails = storyboard.instantiateViewControllerWithIdentifier("DetailVC") as! DetailViewController
                        wellDetails.nameText = location.title
                        wellDetails.beneficiariesText = location.beneficiaries
                        wellDetails.donorText = location.donor
                        wellDetails.completionText = location.completed
                        
                        self.presentViewController(wellDetails, animated: true, completion: nil)
                        
                        
                        
                    }
    }

}
