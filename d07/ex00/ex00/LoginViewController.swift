//
//  LoginViewController.swift
//  ex00
//
//  Created by Ivan Kozlov on 10/12/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var uesrnameInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return uesrnameInput?.text != ""
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MessagesCollectionViewController
        vc.user = uesrnameInput.text!
    }
}
