//
//  CompassViewController.swift
//  MountainViewerApp
//
//  Created by Melissa Lopez on 2/16/17.
//  Copyright © 2017 Melissa Lopez. All rights reserved.
//

import UIKit
import CoreMotion
import CoreLocation

 //Using magnetic compass
class CompassViewController: UIViewController, CLLocationManagerDelegate  {

    //location manager
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //based on users phone orintation
        if (CLLocationManager.headingAvailable()) {
            locationManager.headingFilter = 1
            locationManager.startUpdatingHeading()
            locationManager.delegate = self
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading heading: CLHeading) {
        print ("Compass:", heading.magneticHeading)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
