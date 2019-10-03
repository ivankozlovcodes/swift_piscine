//
//  GameScene.swift
//  ex02
//
//  Created by Ivan Kozlov on 10/3/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameObject: SKSpriteNode {
    
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var player : SKSpriteNode?
    private var pizzaCount: Int = 0;
    private var brocCount: Int = 0;
    

    override func didMove(to: SKView) {
        self.physicsWorld.contactDelegate = self
        self.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.scaleMode = .aspectFit
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody?.categoryBitMask = 0x00000010
        self.physicsBody?.usesPreciseCollisionDetection = true
        
        player = self.childNode(withName: "player") as? SKSpriteNode
        player?.physicsBody = SKPhysicsBody(rectangleOf: player!.frame.size)
        player?.physicsBody?.collisionBitMask = 0x00000010
        player?.physicsBody?.contactTestBitMask = 0x00000001
        let wait = SKAction.wait(forDuration: 0.1)
        let move = SKAction.run(playerMove)
        let food = SKAction.run(spanFood)
        run(SKAction.repeatForever(SKAction.sequence([food, wait])))
        run(SKAction.repeatForever(SKAction.sequence([move, SKAction.wait(forDuration: 0.1)])))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let player = self.player!
        
        if contact.bodyA.node == player && contact.bodyB.node == player {
            print("player has collaided with himself")
            return
        }
        
        if contact.bodyA.node == player {
            contact.bodyB.node?.removeFromParent()
            updateLabels(name: contact.bodyB.node!.name!)
        } else if contact.bodyB.node == player {
            contact.bodyA.node?.removeFromParent()
            updateLabels(name: contact.bodyA.node!.name!)
        }
    }
    
    func updateLabels(name: String) {
        let label = self.childNode(withName: name) as! SKLabelNode
        if name == "Pizza" {
            pizzaCount += 1
        } else {
            brocCount += 1
        }
        let count = name == "Pizza" ? pizzaCount : brocCount
        let attributes = label.attributedText?.attributes(at: 0, effectiveRange: nil)
        label.attributedText = NSAttributedString(string: name + " " + String(count), attributes: attributes)
    }
    
    func playerMove() {
        let vector = CGVector(dx: randomCoord(upper: 50), dy: randomCoord(upper: 100))
        player!.run(SKAction.move(by: vector, duration: 1))
    }
    
    func spanFood() {
        if self.children.count > 100 {
            return
        }

        let isBad = arc4random_uniform(2) == 0
        let imageName = isBad ? "Broccolli" : "Pizza"
        let food = SKSpriteNode.init(imageNamed: imageName)
        food.size = CGSize(width: 40, height: 40)
        food.position = CGPoint(x: randomCoord(upper: self.size.width / 2 - 40), y: randomCoord(upper: self.size.height / 2 - 40))
        food.physicsBody = SKPhysicsBody(rectangleOf: food.frame.size)
        food.physicsBody?.contactTestBitMask = 0x00000001
        food.physicsBody?.collisionBitMask = 0x00000010
        food.name = imageName
        self.addChild(food)
    }
    
    func randomCoord(upper: CGFloat) -> Int {
        let upperInt = UInt32(upper)
        var random = Int(arc4random_uniform(upperInt))
        if arc4random_uniform(2) == 0 {
            random *= -1
        }
        return random
    }
}
