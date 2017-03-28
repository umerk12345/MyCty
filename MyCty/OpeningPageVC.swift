//
//  OpeningPageVC.swift
//  MyCty
//
//  Created by Umer Khan on 3/15/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
extension Timer {
    class func schedule(delay: TimeInterval, handler: ((Timer?) -> Void)!) -> Timer! {
        let fireDate = delay + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, 0, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, .commonModes)
        return timer
    }
}

class OpeningViewController : UIViewController{
    
   

    @IBOutlet weak var sceneView: SKView!

    @IBOutlet weak var sceneView2: SKView!
  
    @IBOutlet weak var sceneView3: SKView!
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var signUp: UIButton!
    
    var scene:cloudScene?
    var scene2:carScene?
    
   override func viewDidLoad() {
        
        //login.layer.cornerRadius = 10
        signUp.layer.cornerRadius = 10
        super.viewDidLoad()

    self.scene = cloudScene(size: CGSize(width: self.sceneView.frame.size.width, height:self.sceneView.frame.size.height))
     self.scene2 = carScene(size: CGSize(width: self.sceneView2.frame.size.width, height:self.sceneView2.frame.size.height))
 
    self.sceneView.presentScene(scene)
    self.sceneView2.presentScene(scene2)
    
    self.scene?.floatingCloud()
    self.scene2?.movingCar()
    
        }
    
}
