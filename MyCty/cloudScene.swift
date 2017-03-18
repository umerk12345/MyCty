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
        
    }
    
    func floatingCloud(){
        
        let cloud = SKSpriteNode(imageNamed: "Cloud" )
        let cloud1 = SKSpriteNode(imageNamed: "Cloud" )
        let cloud2 = SKSpriteNode(imageNamed: "Cloud" )
        let cloud3 = SKSpriteNode(imageNamed: "Cloud" )

        cloud.size = CGSize(width: 81, height: 49)
        cloud1.size = CGSize(width: 64, height: 39)
        cloud2.size = CGSize(width: 81, height: 49)
        cloud3.size = CGSize(width: 64, height: 39)
        
        let yposition = CGFloat(190)
       let y1position = CGFloat(150)
        let y2position = CGFloat(190)
        let y3position = CGFloat(150)
     
        let xPosition = CGFloat(-100)
        let x1Position = CGFloat(-170)
        let x2Position = CGFloat(-240)
        let x3Position = CGFloat(-300)
        
        cloud.position = CGPoint(x: xPosition, y: yposition)
        cloud1.position = CGPoint(x: x1Position, y: y1position)
        cloud2.position = CGPoint(x: x2Position, y: y2position)
        cloud3.position = CGPoint(x: x3Position, y: y3position)
        
        self.addChild(cloud)
        self.addChild(cloud1)
        self.addChild(cloud2)
        self.addChild(cloud3)
        
        let distanceToCover = self.frame.size.width + (cloud.size.width * 5)
        
  
        let moveAction = SKAction.moveBy(x: distanceToCover, y: 0, duration: 30)
        
        let moveToLeft = SKAction.move(to: cloud.position, duration: 0.0)
        let moveToLeft1 = SKAction.move(to: cloud1.position, duration: 0.0)
        let moveToLeft2 = SKAction.move(to: cloud2.position, duration: 0.0)
        let moveToLeft3 = SKAction.move(to: cloud3.position, duration: 0.0)
      
        let actualMovement = SKAction.sequence([moveAction, moveToLeft])
        let actualMovement1 = SKAction.sequence([moveAction, moveToLeft1])
        let actualMovement2 = SKAction.sequence([moveAction, moveToLeft2])
        let actualMovement3 = SKAction.sequence([moveAction, moveToLeft3])

        let endlessMovement = SKAction.repeatForever(actualMovement)
        let endlessMovement1 = SKAction.repeatForever(actualMovement1)
        let endlessMovement2 = SKAction.repeatForever(actualMovement2)
        let endlessMovement3 = SKAction.repeatForever(actualMovement3)
  
        cloud.run(endlessMovement)
        cloud1.run(endlessMovement1)
        cloud2.run(endlessMovement2)
        cloud3.run(endlessMovement3)
        
        }
        
    }
    


    
    


