//
//  TopographyCameraViewController.swift
//  MountainViewerApp
//
//  Created by Melissa Lopez on 3/3/17.
//  Copyright © 2017 Melissa Lopez. All rights reserved.
//

import UIKit
import Mapbox
import CoreLocation

//Not currently initial screen must change intial view to the scene thats called Topography Camera view to see how it displays on device or simulator 
//this view hovers around the location that or current location (uses camera overview from the top)
//using hard coded value to display an actual topography on simulator
class TopographyCameraViewController: UIViewController, MGLMapViewDelegate, CLLocationManagerDelegate {
    
    var contoursLayer: MGLStyleLayer?
    @IBOutlet weak var mapView: MGLMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        */
        
        //using a hardcoded location
        let mapView = MGLMapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.delegate = self
        
        mapView.styleURL = MGLStyle.outdoorsStyleURL(withVersion: 9);
        
        // Piolt Butte
        let center = CLLocationCoordinate2D(latitude: 44.061441, longitude: -121.283245)
        
        // Optional setting a starting point
        mapView.setCenter(center, zoomLevel: 7, direction: 0, animated: false)
        
        view.addSubview(mapView)
        
    }
    
    //current location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        let url = NSURL(string: "mapbox://styles/mapbox/outdoors-v9")
        let mapView = MGLMapView(frame: view.bounds, styleURL: url as URL?)
        mapView.userTrackingMode = .follow
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        mapView.setCenter(center, zoomLevel: 12, animated: false)
        view.addSubview(mapView)
        //addToggleButton()
        self.locationManager.stopUpdatingLocation()
        //self.mapView.showsUserLocation = true
    
    }
    
    func  locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print ("Errors:" + error.localizedDescription)
    }

    //make call to api
    //1. map must load first
    //2. rotaties around 200 degrees 
    //3. camera view only last 10 secconds
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {

        let camera = MGLMapCamera(lookingAtCenter: mapView.centerCoordinate, fromDistance: 4500, pitch: 15, heading: 2000)
        mapView.setCamera(camera, withDuration: 10, animationTimingFunction: CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
    }
}

