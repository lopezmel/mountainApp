//
//  FirstViewController.swift
//  MountainViewerApp
//
//  Created by Melissa Lopez on 1/20/17.
//  Copyright © 2017 Melissa Lopez. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//current location view
class FirstViewController: UIViewController, CLLocationManagerDelegate {

    //Map
    //display current location Map
    @IBOutlet weak var map: MKMapView!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
        
        //print to console
        print(location.altitude)
        print(location.speed)
        
        self.map.showsUserLocation = true
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //constantly update location
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

