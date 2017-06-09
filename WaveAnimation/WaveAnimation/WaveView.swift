//
//  WaveView.swift
//  WaveAnimation
//
//  Created by Qi Xin on 9/6/2017.
//  Copyright © 2017 Omni_Hsin. All rights reserved.
//

import UIKit

class WaveView: UIView {

    var A = 0.0
    var omega = 0.0
    var fi = 0.0
    var height = 0.0
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.height = Double(frame.height);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //y=Asin（ωx+φ）+h
    
    override func draw(_ rect: CGRect) {
        
        let contextRef = UIGraphicsGetCurrentContext()
        
        var pathRef = CGMutablePath()
        
        contextRef!.setLineWidth(1)
        
        let blue = UIColor.blue
        
        contextRef!.setFillColor(blue.cgColor);
        
        let begin = CGPoint.init(x: 0, y: self.height)
        
        pathRef.move(to: begin)

        let from = CGFloat.init(0.0)
        let to = rect.size.width
        
//        for index in 0.0...320.0  {
//            
//            let wx = self.omega * index *  180 / M_PI
//            
//            let Y = self.A * sinf(wx + self.fi) + self.height
//            
//            pathRef.addLine(to: CGPoint.init(x: index, y: Y))
//            
//        }
        
        
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
