//
//  ThirdViewController.swift
//  MountainViewerApp
//
//  Created by Melissa Lopez on 1/20/17.
//  Copyright © 2017 Melissa Lopez. All rights reserved.
//


import UIKit
import CoreMotion

class ThirdViewController: UIViewController {
    
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        //how often to update data if not defined data will always update
        motion.accelerometerUpdateInterval = 0.5
        
        //track motion
        motion.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data
            {
                print ("Acclerometer:", myData) //output = x, y, z
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

