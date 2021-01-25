//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var secondsRemaining = 60
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate() //stop if button is clicked but previous timer is still running
        let hardness = sender.currentTitle! // Soft, Medium, Hard
        secondsRemaining = eggTimes[hardness]!
        //create a brand new timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer(){
        if secondsRemaining > 0{
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        }else{ //time over
            timer.invalidate() //stop the timer
        }
    }
    
}
