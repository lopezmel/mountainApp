//
//  AcclerometerViewController.swift
//  MountainViewerApp
//
//  Created by Melissa Lopez on 2/16/17.
//  Copyright © 2017 Melissa Lopez. All rights reserved.
//

import UIKit
import CoreData
import CoreMotion

//display on console for midterm presentation works the same at the Third View controller but instaead of displaying on screen it displays on console
class AcclerometerViewController: UIViewController {

    var motManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool){
        //updating speed
        motManager.accelerometerUpdateInterval = 0.5
        
        //printing data to console
        motManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data{
                print(myData)

            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
