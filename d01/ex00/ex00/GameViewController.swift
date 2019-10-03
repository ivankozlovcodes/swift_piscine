//
//  GameViewController.swift
//  ex00
//
//  Created by Ivan Kozlov on 10/3/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
//                let cameraNode = SKCameraNode()
//
//                cameraNode.position = CGPoint(x: scene.size.width / 2,
//                                              y: scene.size.height / 2)
//
//                scene.addChild(cameraNode)
//                scene.camera = cameraNode
                
                
//                let image = SKSpriteNode(imageNamed: "spaceship")
//                scene.addChild(image)
//                cameraNode.xScale = 2
//                cameraNode.yScale = 2
//                cameraNode.zRotation = 2
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
