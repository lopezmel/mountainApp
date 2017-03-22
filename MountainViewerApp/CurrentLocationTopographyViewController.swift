//
//  CurrentLocationTopographyViewController.swift
//  MountainViewerApp
//
//  Created by Melissa Lopez on 3/20/17.
//  Copyright © 2017 Melissa Lopez. All rights reserved.
//

import UIKit
import Mapbox
import CoreLocation

//using terrian api to display the current location
//button that can hide or disapear countour lines only works on single view
class CurrentLocationTopographyViewController: UIViewController, MGLMapViewDelegate, CLLocationManagerDelegate{
    
    var contoursLayer: MGLStyleLayer?

    @IBOutlet weak var mapView: MGLMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        //addToggleButton()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    //getting users location and passing it into mapView Center
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        let url = NSURL(string: "mapbox://styles/mapbox/outdoors-v9")
        let mapView = MGLMapView(frame: view.bounds, styleURL: url as URL?)
        mapView.userTrackingMode = .follow
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        mapView.setCenter(center, zoomLevel: 12, animated: false)
        view.addSubview(mapView)
        addToggleButton()
        self.locationManager.stopUpdatingLocation()
        //self.mapView.showsUserLocation = true
        
        
    }
    
    func  locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print ("Errors:" + error.localizedDescription)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        addLayer(to: style)
    }
    
    func addLayer(to style: MGLStyle) {
        let source = MGLVectorSource(identifier: "contours", configurationURL: NSURL(string: "mapbox://mapbox.mapbox-terrain-v2")! as URL)
        
        let layer = MGLLineStyleLayer(identifier: "contours", source: source)
        layer.sourceLayerIdentifier = "contour"
        layer.lineJoin = MGLStyleValue(rawValue: NSValue(mglLineJoin: .round))
        layer.lineCap = MGLStyleValue(rawValue: NSValue(mglLineCap: .round))
        layer.lineColor = MGLStyleValue(rawValue: UIColor.brown)
        layer.lineWidth = MGLStyleValue(rawValue: 1.0)
        
        style.addSource(source)
        //adding a water layer
        if let water = style.layer(withIdentifier: "water") {
            style.insertLayer(layer, below: water)
        } else {
            style.addLayer(layer)
        }
        
        self.contoursLayer = layer
        
        showContours()
    }
    
    //button that disaplys the contour lines
    func toggleLayer(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            showContours()
        } else {
            hideContours()
        }
    }
    //hitting the button to show
    func showContours() {
        self.contoursLayer?.isVisible = false
    }
    
    //hititng the button to hide
    func hideContours() {
        self.contoursLayer?.isVisible = true
    }
    //call from the api to display the button and is correctly displaying on the screen
    func addToggleButton() {
        let button = UIButton(type: .system)
        button.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin]
        button.setTitle("Toggle Contours", for: .normal)
        button.isSelected = true
        button.sizeToFit()
        button.center.x = self.view.center.x
        button.frame = CGRect(origin: CGPoint(x: button.frame.origin.x, y: self.view.frame.size.height - button.frame.size.height - 5), size: button.frame.size)
        button.addTarget(self, action: #selector(TopographyViewController.toggleLayer(sender:)), for: .touchUpInside)
        self.view.addSubview(button)
    }

    
    
    

}
