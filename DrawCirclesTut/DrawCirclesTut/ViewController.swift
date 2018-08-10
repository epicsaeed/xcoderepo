//
//  ViewController.swift
//  DrawCirclesTut
//
//  Created by Saeed on 20.07.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            //set center of circle
            let circleCenter = touch.location(in:view)
            
            //set random circle radius
            let circleWidth =  CGFloat(25 + (arc4random()%50))
            let circleHeight = circleWidth
            
            //Crerate new circleView
            let circleView = CircleView(frame: CGRect(x:circleCenter.x,y:circleCenter.y,width:circleWidth,height:circleHeight))
            view.addSubview(circleView)
            
            
            
            
            
            
        }
    }


}

