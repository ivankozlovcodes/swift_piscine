//
//  ViewController.swift
//  ex00
//
//  Created by Ivan Kozlov on 10/4/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var timeLabel: UILabel!
    
    var time: Double = 0;
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        resetTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func updateTimeLabel() {
        let formatter = DateFormatter()
        let date = Date(timeIntervalSinceReferenceDate: -(16 * 3600) + time)
        
        formatter.dateFormat = "HH:mm:ss"
        timeLabel.text = formatter.string(from: date)
    }

    @IBAction func startTimer() {
        if timer.isValid {
            return
        }
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.time += timer.timeInterval
            self.updateTimeLabel()
        })
    }
    
    @IBAction func stopTimer() {
        timer.invalidate()
    }

    @IBAction func resetTimer() {
        stopTimer()
        time = 0
        updateTimeLabel()
    }
}

