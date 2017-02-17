//
//  ThirdViewController.swift
//  MountainViewerApp
//
//  Created by Melissa Lopez on 1/20/17.
//  Copyright © 2017 Melissa Lopez. All rights reserved.
//


import UIKit
import CoreMotion
import CoreLocation

class ThirdViewController: UIViewController {
    

    var motion = CMMotionManager()
    
    //store values
    var curMaxAccx: Double = 0.0
    var curMaxAccy: Double = 0.0
    var curMaxAccz: Double = 0.0

    
    //CMMotionManager = access varias motions
    var movementManager = CMMotionManager()
    
    
    @IBOutlet weak var accX: UILabel!
    @IBOutlet weak var accY: UILabel!
    @IBOutlet weak var accZ: UILabel!
    
    @IBOutlet weak var maxAccx: UILabel!
    @IBOutlet weak var maxAccy: UILabel!
    @IBOutlet weak var maxAccz: UILabel!
    
    

    
    @IBAction func resetMaxValues() {
        curMaxAccx = 0
        curMaxAccy = 0
        curMaxAccz = 0
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //start values at 0
        curMaxAccx = 0
        curMaxAccy = 0
        curMaxAccz = 0

        
        movementManager.accelerometerUpdateInterval = 0.2
        //movementManager.gyroUpdateInterval = 0.2
        
        
        movementManager.startAccelerometerUpdates(to: OperationQueue.current!) { (accelerometerData: CMAccelerometerData?, NSError) -> Void in
        
            self.outputAccData(acceleration: accelerometerData!.acceleration)
            
            if(NSError != nil) {
                print("\(NSError)")
            }
            
        }//movementStart Acc
        
   
    }//view did load
    
    
    //finidng the hightes number and displaying it
    func outputAccData(acceleration: CMAcceleration){
        accX?.text = "\(acceleration.x).2fg"
        if fabs(acceleration.x) > fabs(curMaxAccx){
            curMaxAccx = acceleration.x
        }
    
        accY?.text = "\(acceleration.y).2fg"
        if fabs(acceleration.y) > fabs(curMaxAccy){
            curMaxAccy = acceleration.y
        }

        accZ?.text = "\(acceleration.z).2fg"
        if fabs(acceleration.z) > fabs(curMaxAccz){
            curMaxAccz = acceleration.z
        }

        //pouring out data 
        maxAccx?.text = "\(curMaxAccx)"
        maxAccy?.text = "\(curMaxAccy)"
        maxAccz?.text = "\(curMaxAccz)"
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
