//
//  ViewController.swift
//  Egg Timer
//
//  Created by Saliya Ediriweera on 10/26/20.
//  Copyright © 2020 Saliya Ediriweera. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    let eggTimes = ["Soft":3, "Medium": 4, "Hard": 7];
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed)/Float(totalTime)
            
        } else{
            timer.invalidate()
            titleLabel.text = "DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
}

