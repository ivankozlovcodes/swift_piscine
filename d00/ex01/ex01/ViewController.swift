//
//  ViewController.swift
//  ex01
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


    @IBOutlet var label: UILabel!
    @IBAction func changeFontAction(_ sender: UIButton) {
        label.font = sender.titleLabel?.font
        let alertController = UIAlertController(title: "What's up", message: "The font has changed", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Everything is changing", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

