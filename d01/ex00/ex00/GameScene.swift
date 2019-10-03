//
//  GameScene.swift
//  ex00
//
//  Created by Ivan Kozlov on 10/3/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    private var startPoint : CGPoint?
    private var spaceshipNode : SKSpriteNode?
    
    override func sceneDidLoad() {
        self.spaceshipNode = self.childNode(withName: "spaceshipNode") as? SKSpriteNode
        self.startPoint = self.spaceshipNode?.anchorPoint
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let nsSet = NSSet(set: touches)
        let touch:UITouch = nsSet.anyObject()! as! UITouch
        let positionInScene = touch.location(in: self)
        let node = self.atPoint(positionInScene)

        if node.name != "spaceshipNode" {
            return
        }

        if let spaceshipNode = self.spaceshipNode {
            let startPoint = spaceshipNode.position

            let scaleOut = SKAction.scale(by: -1, duration: 5)
            let fly = SKAction.moveTo(y: self.size.height / 2, duration: 3)
            
            spaceshipNode.run(SKAction.group([scaleOut, fly]), completion: {
                spaceshipNode.xScale = 0.7
                spaceshipNode.yScale = 0.7
                spaceshipNode.position = startPoint
            })
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
