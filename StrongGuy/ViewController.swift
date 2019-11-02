//
//  ViewController.swift
//  StrongGuy
//
//  Created by 박창현 on 11/2/19.
//  Copyright © 2019 박창현. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startAccelerometers()
    }
   
    
    
    func startAccelerometers() {
        var total = 0.0
        var distance = 0.0
        motion.accelerometerUpdateInterval = 0.2
        
        motion.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            //print (data as Any)
            if let trueData = data {
                self.view.reloadInputViews()
                let x = trueData.acceleration.x
                let y = trueData.acceleration.y
                let z = trueData.acceleration.z
                
                distance = 0.0
                
                
                
                self.moveNail(distance_x : x, distance_y : y)
                
                //self.yAccel.text = "x: \(Double(y).rounded(toPlaces: 3))"
                //self.zAccel.text = "x: \(Double(z).rounded(toPlaces: 3))"
                
            }
        }
        
    }
    
    
    @IBOutlet weak var Nail: UIImageView!
    
    func moveNail(distance_x : Double, distance_y : Double) {
        
        self.Nail.center.x -= CGFloat(distance_x)
        self.Nail.center.y -= CGFloat(distance_y)
    }
    

}

