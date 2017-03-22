//
//  MapViewController.swift
//  MountainViewerApp
//
//  Created by Melissa Lopez on 3/10/17.
//  Copyright © 2017 Melissa Lopez. All rights reserved.
//

import UIKit
import Mapbox

//calling url to render 3d terrinan
//hard coded Piolt Butte
class MapViewController: UIViewController {


        override func viewDidLoad() {
            super.viewDidLoad()
            
            //1. Making URL call to display the terrain topography
            //2.pass x y z values 
            //**unsucessful IOS is still a betta version and point cloud version is still being 
            //developed 
            //https://www.mapbox.com/blog/terrain-rgb/
            let styleURL = NSURL(string: "https://api.mapbox.com/v4/mapbox.terrain-rgb/{x}/{y}/{z}.pngraw?access_token=pk.eyJ1IjoibG9wZXptZTE3IiwiYSI6ImNpejFxZ2lpdDA0bnEzMm9hc2w5cjlxZ2oifQ.vCdI4BB0bgwrp4g7oiklQA")
            let mapView = MGLMapView(frame: view.bounds,
                                     styleURL: styleURL as URL?)
            mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            // Set the map’s center coordinate and zoom level
            mapView.setCenter(CLLocationCoordinate2D(latitude: 44.061441, longitude: -121.283245), zoomLevel: 14, animated: false)
            view.addSubview(mapView)
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
