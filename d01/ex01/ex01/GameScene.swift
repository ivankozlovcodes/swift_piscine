//
//  GameScene.swift
//  ex01
//
//  Created by Ivan Kozlov on 10/3/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var getHypedButton : SKShapeNode?
    private var levelCount : CGFloat = 0;
    private var level : SKShapeNode?
    
    override func sceneDidLoad() {
        getHypedButton = self.childNode(withName: "button") as? SKShapeNode
        getHypedButton?.zPosition = 1
        getHypedButton?.strokeColor = UIColor(white: 0, alpha: 0)
        
        self.level = SKShapeNode.init(rectOf: CGSize.init(width: self.size.width, height: self.size.height))
        if let level = self.level {
            level.zPosition = -1
            level.position = CGPoint.init(x: 0, y: -self.size.height)
            level.fillColor = SKColor.blue
            level.strokeColor = SKColor.blue
            self.addChild(level)
        }
        
        
        Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: { t in
            if let level = self.level {
                self.levelCount -= 100;
                if self.levelCount < 0 {
                    self.levelCount = 0
                }
                level.run(SKAction.moveTo(y: -self.size.height + self.levelCount, duration: 2))
            }
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let positionInScene = touch.location(in: self)
            let touchedNode = self.atPoint(positionInScene)
            if touchedNode.name == "button" {
                getHypedButton?.run(SKAction.rotate(byAngle: 10, duration: 1))
                if let level = self.level {
                    self.levelCount += 50
                    if self.levelCount > self.size.height {
                        self.levelCount = self.size.height
                    }
                    level.run(SKAction.moveTo(y: -self.size.height + self.levelCount, duration: 2))
                }
            }
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
