//
//  ViewController.swift
//  Dice Roll
//
//  Created by Saeed on 18.07.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var sumLabel: UILabel!
    
    @IBOutlet weak var rightImage: UIImageView!
    
    @IBOutlet weak var leftImage: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let numberOne = arc4random_uniform(6) + 1
        let numberTwo = arc4random_uniform(6) + 1
        
        sumLabel.text = "The sum is \(numberOne + numberTwo)"
        leftImage.image = UIImage(named: "Dice\(numberOne)")
        rightImage.image = UIImage(named: "Dice\(numberTwo)")
    
        
    }
    
    
    
    
    
    
    
    
    
}

