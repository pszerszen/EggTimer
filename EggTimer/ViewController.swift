//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let EGG_TYPES:[String:Int] = [
        "Soft": 5 * 60,
        "Medium": 7 * 60,
        "Hard": 12 * 60
    ]
    var timer = Timer()
    var totalTime = 0
    var timePassed = 0
    
    @IBAction func harnessSelected(_ sender: UIButton) {
        let hardness:String = sender.currentTitle!;
        
        totalTime = EGG_TYPES[hardness]!
        timePassed = 0
        topLabel.text = hardness
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if timePassed < totalTime {
            timePassed += 1
            progressBar.progress = Float(timePassed) / Float(totalTime)
            print("progress: \(progressBar.progress)")
        } else {
            timer.invalidate()
            topLabel.text = "Done"
        }
    }

}
