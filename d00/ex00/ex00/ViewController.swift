//
//  ViewController.swift
//  ex00
//
//  Created by Ivan Kozlov on 9/30/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var helloThereLabel: UILabel!
    @IBAction func onHelloThereClick() {
        print("Hello there!")
        helloThereLabel.text = "Hello there!"
    }
}

