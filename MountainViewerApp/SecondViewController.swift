//
//  SecondViewController.swift
//  MountainViewerApp
//
//  Created by Melissa Lopez on 1/20/17.
//  Copyright © 2017 Melissa Lopez. All rights reserved.
//

import UIKit
import CoreLocation

class SeccondViewController: UIViewController ,CLLocationManagerDelegate {
    
    var location:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location = CLLocationManager()
        location.delegate = self
        
        location.startUpdatingHeading()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Rotation Based on device rotation and using magnetic compass
    //not functioning correctly...
    func locationManager(manager: CLLocationManager!, didUpdateHeading newHeading: CLHeading!) {
        print("Compass:", newHeading.magneticHeading)
    }
}
