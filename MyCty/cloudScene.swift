//
//  cloudScene.swift
//  MyCty
//
//  Created by Umer Khan on 3/16/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

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
        let cloud1 = SKSpriteNode(texture: texture)
        let cloud2 = SKSpriteNode(texture: texture)
        let cloud3 = SKSpriteNode(texture: texture)
        cloud.size = CGSize(width: 81, height: 49)
        cloud1.size = CGSize(width: 64, height: 39)
        cloud2.size = CGSize(width: 81, height: 49)
        cloud3.size = CGSize(width: 64, height: 39)
        //let CloudY = GKRandomDistribution(lowestValue: Int(Float(160.0)), highestValue: Int(Float((160.0))))
        let yposition = CGFloat(190)
       let y1position = CGFloat(150)
        let y2position = CGFloat(190)
        let y3position = CGFloat(150)
        let leftToRight = arc4random() % 2 == 0
        //let RightToLeft = arc4random() % 2 != 0
       
        let xPosition = CGFloat(1)
        let x1Position = CGFloat(70)
        let x2Position = CGFloat(140)
        let x3Position = CGFloat(200)
        //let xPosition = leftToRight ? self.frame.size.width + cloud.size.width + cloud.size.width / 2 : -cloud.size.width / 2
        
        cloud.position = CGPoint(x: xPosition, y: yposition)
        cloud1.position = CGPoint(x: x1Position, y: y1position)
        cloud2.position = CGPoint(x: x2Position, y: y2position)
        cloud3.position = CGPoint(x: x3Position, y: y3position)
        //if RightToLeft {
          // cloud.xScale = -1
      //  }
        self.addChild(cloud)
        self.addChild(cloud1)
        self.addChild(cloud2)
        self.addChild(cloud3)
        
        cloud.run(SKAction.repeatForever(SKAction.animate(with: self.cloudFrames!, timePerFrame: 0.05, resize: false, restore: true)))
        
        var distanceToCover = self.frame.size.width + cloud.size.width
        
        //if leftToRight{
          //  distanceToCover += -1
            
        //}
        
        //let time = TimeInterval(abs(distanceToCover / 100))
        let moveAction = SKAction.moveBy(x: distanceToCover, y: 0, duration: 60)
        
        //let finalAction = SKAction.repeatForever(moveAction)
        
        
        let removeAction = SKAction.run {
           cloud.removeAllActions()
            cloud.removeFromParent()
        }
        
        //let repeatMove = SKAction.(moveAction)
        
        let actualMovement = SKAction.sequence([moveAction, removeAction])
        //}
        let endlessMovement = SKAction.repeatForever(actualMovement)
        //let allActions = SKAction.repeatForever(moveAction)
        //[moveAction, removeAction])
//cloud.run(moveAction)
        cloud.run(endlessMovement)
        cloud1.run(endlessMovement)
        cloud2.run(endlessMovement)
        cloud3.run(endlessMovement)
        
    
     

            
            
        }
        
    }
    


    
    


