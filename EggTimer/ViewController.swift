//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]
    
    var timer: Timer?
    
    var totalSeconds = 0
    var secondsRemaining = 0
    
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @objc func updateCounter() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds")
            secondsRemaining -= 1
            let progress = 1 - (Float(secondsRemaining) / Float(totalSeconds))
            progressBar.progress = progress
    
        } else {
            timer?.invalidate()
            message.text = "Done"
            progressBar.progress = 1.0
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer?.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalSeconds = eggTimes[hardness]!
        secondsRemaining = totalSeconds
        
        progressBar.progress = 0.0
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        
        
    }
    
}
