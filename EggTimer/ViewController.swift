//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet weak var progressBar: UIProgressView!
    var secondsPassed = 60.0
    var timer = Timer()
    let eggTimes = ["Soft":3.0,"Medium":4.0,"Hard":7.0]
    var totalTIme = 0.0
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 0.0
        let hardness =  sender.currentTitle
        timer.invalidate()
        
        secondsPassed = 0
        totalTIme = eggTimes[hardness!]!
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
  @objc func updateTimer(){
        if secondsPassed < totalTIme {
            secondsPassed += 1.0
            progressBar.progress = Float(secondsPassed/totalTIme)
        }else {
            timer.invalidate()
            titleLabel.text = "Done!"
            playDoneSound()
        }
      
    }
    
    func playDoneSound(){
        var player : AVAudioPlayer!
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
         player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
