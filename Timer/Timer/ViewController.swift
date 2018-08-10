//
//  ViewController.swift
//  Timer
//
//  Created by Saeed on 18.07.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK: Variables
    var time = 0
    var timer = Timer()
    
    
    //MARK: Labels
    @IBOutlet weak var timerLabel: UILabel!
    
    
    
    //MARK: Buttons
    @IBAction func startBtn(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target:self,selector: #selector(ViewController.action), userInfo:nil ,repeats: true)
    }
    @IBAction func pauseBtn(_ sender: UIButton) {
        timer.invalidate()
    }
    @IBAction func resetBtn(_ sender: UIButton) {
        timer.invalidate()
        time = 0
        timerLabel.text = String(time)
    }
    
    //MARK: Functions
    
    @objc func action(){
        time += 1
        timerLabel.text = String(time)
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }


}

