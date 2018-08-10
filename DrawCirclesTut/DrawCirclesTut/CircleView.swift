//
//  CircleView.swift
//  DrawCirclesTut
//
//  Created by Saeed on 20.07.18.
//  Copyright © 2018 Saeed. All rights reserved.
//

import UIKit

class CircleView: UIView {

    override init(frame: CGRect){
        super .init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect){
        //get graphics context
        if let context = UIGraphicsGetCurrentContext(){
            
            //Set sircle radius
            context.setLineWidth(5.0)
            
            //Set circle outerline color
            UIColor.blue.set()
            
            //Create circles
            let center = CGPoint(x: frame.size.width/2, y:frame.size.height/2)
            let radius = (frame.size.width - 10)/2
            context.addArc(center: center, radius: radius, startAngle: 0.0, endAngle: .pi*2.0, clockwise: true)
            
            //Draw
            context.strokePath()
        }
    }

}
