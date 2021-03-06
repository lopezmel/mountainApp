//
//  TopographyViewController.swift
//  MountainViewerApp
//
//  Created by Melissa Lopez on 3/3/17.
//  Copyright © 2017 Melissa Lopez. All rights reserved.
//

import UIKit
import Mapbox
//hard coded location with button displaying Pilot Butte for demo purposes to dsiplay anctually place with trails and contour lines that are visable
class TopographyViewController: UIViewController, MGLMapViewDelegate {
    var mapView: MGLMapView!
    var contoursLayer: MGLStyleLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mapView = MGLMapView(frame: view.bounds)
        //mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //making a url call to the outdoors style url
        let url = NSURL(string: "mapbox://styles/mapbox/outdoors-v9")
        mapView = MGLMapView(frame: view.bounds, styleURL: url as URL?)
        
        
        //Piolt Butte
        mapView.setCenter(CLLocationCoordinate2D(latitude: 44.061441, longitude: -121.283245), zoomLevel: 14.5, animated: false)
      
        view.addSubview(mapView)
        
        //be able to turn on and off the contour lines on the device
        addToggleButton()
        
        mapView.delegate = self
    }
    
    // Wait until the style is loaded before modifying the map style
    func mapView(_ mapView: MGLMapView, didFinishLoading style: MGLStyle) {
        addLayer(to: style)
    }
    
    //layer to display the countrour lines which comes form teh terrain-v2 URL
    //styling to what color to display the lines to to the size
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
