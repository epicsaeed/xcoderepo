//
//  ViewController.swift
//  WarApp
//
//  Created by Saeed on 20.07.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlets
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Functions
    
    @IBAction func dealTapped(_ sender: Any) {

        let leftRandomNumber = arc4random_uniform(13) + 2
        let rightRandomNumber = arc4random_uniform(13) + 2
        
        leftImageView.image = UIImage(named: "card\(leftRandomNumber)")
        rightImageView.image = UIImage(named: "card\(rightRandomNumber)")
        
        if leftRandomNumber > rightRandomNumber{
            leftScore += 1
            leftScoreLabel.text = String(leftScore)
        }
        else if leftRandomNumber < rightRandomNumber{
            rightScore += 1
            rightScoreLabel.text = String(rightScore)
        }
        else if leftRandomNumber == rightRandomNumber{
            rightScoreLabel.text = String("TIE!")
            leftScoreLabel.text = String("TIE!")
        }
    }
}

