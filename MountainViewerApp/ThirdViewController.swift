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
    var curMaxRX: Double = 0.0
    var curMaxRY: Double = 0.0
    var curMaxRZ: Double = 0.0
    
    //CMMotionManager = How can access varias motions
    var movementManager = CMMotionManager()
    
    
    @IBOutlet weak var accX: UILabel!
    @IBOutlet weak var accY: UILabel!
    @IBOutlet weak var accZ: UILabel!
    
    @IBOutlet weak var maxAccx: UILabel!
    @IBOutlet weak var maxAccy: UILabel!
    @IBOutlet weak var maxAccz: UILabel!
    
    
    @IBOutlet weak var rX: UILabel!
    @IBOutlet weak var rY: UILabel!
    @IBOutlet weak var rZ: UILabel!
    
    @IBOutlet weak var maxRX: UILabel!
    @IBOutlet weak var maxRY: UILabel!
    @IBOutlet weak var maxRZ: UILabel!
    
    @IBAction func resetMaxValues() {
        curMaxAccx = 0
        curMaxAccy = 0
        curMaxAccz = 0
        curMaxRX = 0
        curMaxRY = 0
        curMaxRZ = 0
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        curMaxAccx = 0
        curMaxAccy = 0
        curMaxAccz = 0
        curMaxRX = 0
        curMaxRY = 0
        curMaxRZ = 0
        
        movementManager.accelerometerUpdateInterval = 0.2
        movementManager.gyroUpdateInterval = 0.2
        
        
        movementManager.startAccelerometerUpdates(to: OperationQueue.current!) { (accelerometerData: CMAccelerometerData?, NSError) -> Void in
        
            self.outputAccData(acceleration: accelerometerData!.acceleration)
            
            if(NSError != nil) {
                print("\(NSError)")
            }
            
        }//movementStart Acc
        
        movementManager.startGyroUpdates(to: OperationQueue.current!, withHandler: { (gyroData: CMGyroData?, NSError) -> Void in
            
            self.outputRotData(rotation: gyroData!.rotationRate)

            if (NSError != nil){
                print("\(NSError)")
            }
        
        })
    
        
    }//view did load
    
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

        maxAccx?.text = "\(curMaxAccx).2f"
        maxAccy?.text = "\(curMaxAccy).2f"
        maxAccz?.text = "\(curMaxAccz).2f"
        
        
    }
    
    func outputRotData(rotation: CMRotationRate){
    
        rX?.text = "\(rotation.x).2fr/s"
        if fabs(rotation.x) > fabs(curMaxRX){
            curMaxRX = rotation.x
        }
        
        rY?.text = "\(rotation.y).2fr/s"
        if fabs(rotation.y) > fabs(curMaxRY){
            curMaxRY = rotation.y
        }
        
        rZ?.text = "\(rotation.z).2fr/s"
        if fabs(rotation.z) > fabs(curMaxRZ){
            curMaxRZ = rotation.z
        }
        
        maxRX?.text = "\(curMaxRX).2f"
        maxRY?.text = "\(curMaxRY).2f"
        maxRZ?.text = "\(curMaxRZ).2f"
        
    }

    /*
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
    */
    
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
