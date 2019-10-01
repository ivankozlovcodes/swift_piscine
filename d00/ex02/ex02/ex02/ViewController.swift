//
//  ViewController.swift
//  ex02
//
//  Created by Ivan Kozlov on 9/30/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var animating = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fireConfetti() {
        if animating {
            return
        }

        let emitter = EmitterFactory.getEmitter(with: #imageLiteral(resourceName: "Oval"),
                                                x: view.frame.width / 4,
                                                y: view.frame.height / 4)
        let emitter2 = EmitterFactory.getEmitter(with: #imageLiteral(resourceName: "Oval2"),
                                                 x: view.frame.width / 2,
                                                 y: view.frame.height / 2)
        let emitter3 = EmitterFactory.getEmitter(with: #imageLiteral(resourceName: "Oval3"),
                                                 x: view.frame.width / 4 * 3,
                                                 y: view.frame.height / 4)
        let emitter4 = EmitterFactory.getEmitter(with: #imageLiteral(resourceName: "Oval4"),
                                                 x: view.frame.width / 4,
                                                 y: view.frame.height / 4 * 3)
        let emitter5 = EmitterFactory.getEmitter(with: #imageLiteral(resourceName: "Oval5"),
                                                 x: view.frame.width / 4 * 3,
                                                 y: view.frame.height / 4 * 3)
        view.layer.addSublayer(emitter)
        view.layer.addSublayer(emitter2)
        view.layer.addSublayer(emitter3)
        view.layer.addSublayer(emitter4)
        view.layer.addSublayer(emitter5)
        animating = true
    }

    @IBAction func stopConfetti() {
        for layer in view.layer.sublayers ?? [] {
            if let emitter = layer as? CAEmitterLayer {
                emitter.removeFromSuperlayer()
            }
        }
        animating = false
    }
    
    
    @IBOutlet var label: UILabel!
    @IBAction func changeLableFonr(sender: UIButton) {
        label.font = sender.titleLabel?.font
    }
}

