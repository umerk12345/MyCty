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
    /*
extension SKAction {
    
    static func repeatAction(action:SKAction,interval:TimeInterval) -> SKAction {
        
        // diff between interval and action.duration will be the wait time. This makes interval the interval between action starts. Max of 0 and diff to make sure it isn't smaller than 0
        let waitAction = SKAction.wait(forDuration: max(0,interval - action.duration))
        let sequenceAction = SKAction.sequence([waitAction,action])
        let repeatAction = SKAction.repeatForever(sequenceAction)
        
        return repeatAction
        
    }
}
*/
class OpeningViewController : UIViewController{
    
   

    @IBOutlet weak var sceneView: SKView!

    @IBOutlet weak var sceneView2: SKView!
  
    @IBOutlet weak var sceneView3: SKView!
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var signUp: UIButton!
    
    var scene:cloudScene?
    var scene2:carScene?
    var scene3:greenCarScene?
    var scene4:redCarScene?
    /*
    class cloudScene: SKScene {
        
        var cloudFrames:[SKTexture]?
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        override init(size: CGSize){
            super.init(size: size)
            self.backgroundColor = UIColor(red: 159.0/255.0, green: 231.0/255.0, blue: 233.0/255.0, alpha: 1.0)
            var frames:[SKTexture] = []
            
            let cloudAtlas = SKTextureAtlas(named: "Cloud")
            
            for index in 1 ... 6 {
                let textureName = "cloud_\(index)"
                let texture = cloudAtlas.textureNamed(textureName)
                frames.append(texture)
                
            }
            self.cloudFrames = frames
            
        }
        
        
        
        
        func floatingCloud(){
            let texture = self.cloudFrames![0]
            let cloud = SKSpriteNode(texture: texture)
            
            cloud.size = CGSize(width: 81, height: 49)
            
            
            //let CloudY = GKRandomDistribution(lowestValue: Int(Float(160.0)), highestValue: Int(Float((160.0))))
            let yposition = CGFloat(160)
            
            let leftToRight = arc4random() % 2 == 0
            //let RightToLeft = arc4random() % 2 != 0
            
            let xPosition = CGFloat(1)
            //let xPosition = leftToRight ? self.frame.size.width + cloud.size.width + cloud.size.width / 2 : -cloud.size.width / 2
            
            cloud.position = CGPoint(x: xPosition, y: yposition)
            
            //if RightToLeft {
            // cloud.xScale = -1
            //  }
            self.addChild(cloud)
            
            cloud.run(SKAction.repeatForever(SKAction.animate(with: self.cloudFrames!, timePerFrame: 0.05, resize: false, restore: true)))
            
            var distanceToCover = self.frame.size.width + cloud.size.width
            
            //if leftToRight{
            //  distanceToCover += -1
            
            //}
            
            //let time = TimeInterval(abs(distanceToCover / 100))
            let moveAction = SKAction.moveBy(x: distanceToCover, y: 0, duration: 10.05)
            //let finalAction = SKAction.repeatForever(moveAction)
            
            
             let removeAction = SKAction.run {
            // cloud.removeAllActions()
             cloud.removeFromParent()
            }
            
            //let repeatMove = SKAction.(moveAction)
            
            let actualMovement = SKAction.sequence([moveAction, removeAction])
            //}
           // print("here")
            //let endlessMovement = SKAction.repeatForever(actualMovement)
            print("gothere")
            //let allActions = SKAction.repeatForever(moveAction)
            //[moveAction, removeAction])
            //cloud.run(moveAction)
            cloud.run(SKAction.repeatForever(SKAction.sequence([moveAction, .wait(forDuration: 1.0)])
            ))
            //cloud.run(SKAction.repeatAction(action: actualMovement, interval: 3.0))
                
            
            
        }
        
        
        
        
        
    
    }

    
    */
  
   override func viewDidLoad() {
        
        login.layer.cornerRadius = 10
        signUp.layer.cornerRadius = 10
        super.viewDidLoad()


    
    self.scene = cloudScene(size: CGSize(width: self.sceneView.frame.size.width, height:self.sceneView.frame.size.height))
     self.scene2 = carScene(size: CGSize(width: self.sceneView2.frame.size.width, height:self.sceneView2.frame.size.height))
    //self.scene3 = greenCarScene(size: CGSize(width: self.sceneView3.frame.size.width, height:self.sceneView3.frame.size.height))
    
    self.sceneView.presentScene(scene)
    self.sceneView2.presentScene(scene2)
//self.sceneView3.presentScene(scene3)
   
    
    //self.scene4 = redCarScene(size: CGSize(width: self.sceneView2.frame.size.width, height:self.sceneView2.frame.size.height))
    //self.sceneView2.presentScene(scene4)
    
    //if let scene = self.scene{
     self.scene?.floatingCloud()
    self.scene2?.movingCar()
   // self.scene3?.movingCar2()
   // self.scene3?.movingCar2()
    //self.scene4?.movingCar3()
  //self.addChild(cloud)
    //var timer = Timer.init(timeInterval: <#T##TimeInterval#>, repeats: <#T##Bool#>, block: @escaping (Timer -> Void) -> Timer)
        //self.scene?.floatingCloud()
    
   
        }
    
    
 /*
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*self.scene = cloudScene(size: CGSize(width: self.sceneView.frame.size.width, height:self.sceneView.frame.size.height))
        self.sceneView.presentScene(scene)
        //if let scene = self.scene{
        scene?.floatingCloud()
      //  }
    
    */
    }

    
    */
    
}
