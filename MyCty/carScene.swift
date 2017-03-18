//
//  carScene.swift
//  MyCty
//
//  Created by Umer Khan on 3/17/17.
//  Copyright © 2017 Umer Khan. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class carScene: SKScene {
    
    var carFrames:[SKTexture]?
    var greenFrames:[SKTexture]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(size: CGSize){
        super.init(size: size)
        self.backgroundColor = UIColor(red: 106.0/255.0, green: 106.0/255.0, blue: 106.0/255.0, alpha: 1.0)
    }
    
    func movingCar(){
      
        let blueCar = SKSpriteNode(imageNamed: "Blue Car")
        let redCar = SKSpriteNode(imageNamed: "Red Car")
        let greenTruck = SKSpriteNode(imageNamed: "Green Car" )
        
        redCar.size = CGSize(width: 122, height: 53)
        blueCar.size = CGSize(width: 122, height: 53)
        greenTruck.size =  CGSize(width: 160, height: 74)
        
        let yposition = CGFloat(50)
        let y2position = CGFloat(120)
        
        let xPosition = CGFloat(-100)
        let x1Position = CGFloat(-250)
        
        let x3Position = CGFloat(500)
        
        blueCar.position = CGPoint(x: xPosition, y: yposition)
        greenTruck.position = CGPoint(x: x3Position, y: y2position)
        redCar.position = CGPoint(x : x1Position, y: yposition)
        
        self.addChild(blueCar)
        self.addChild(greenTruck)
        self.addChild(redCar)

        greenTruck.xScale = -1
        
        let distanceToCover = self.frame.size.width + (blueCar.size.width * 3)
    
        let moveAction = SKAction.moveBy(x: distanceToCover, y: 0, duration: 10.0)
        
        let moveToLeft = SKAction.move(to: blueCar.position, duration: 0.0)
        let moveToLeft2 = SKAction.move(to: redCar.position, duration: 0.0)
        let moveToRight = SKAction.move(to: greenTruck.position, duration: 0.0)
        
        let actualMovement = SKAction.sequence([moveAction,  moveToLeft])
        let reverseMovement = SKAction.sequence([moveAction.reversed(), moveToRight])
        let actualMovement2 = SKAction.sequence([moveAction,  moveToLeft2])

        let endlessMovement = SKAction.repeatForever(actualMovement)
        let endlessMovement2 = SKAction.repeatForever(reverseMovement)
        let endlessMovement3 = SKAction.repeatForever(actualMovement2)
        
        redCar.run(endlessMovement3)
        blueCar.run(endlessMovement)
        greenTruck.run(endlessMovement2)
  
        }
        
    
    
    
}



