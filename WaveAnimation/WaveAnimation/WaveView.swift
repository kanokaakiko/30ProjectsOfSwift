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
    
    var b = 0.0
    
    var link: CADisplayLink?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
         self.height = Double(frame.height);
    }
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.height = Double(frame.height);
    }
    
//    init(_ A: Double, _ omega: Double, _ fi: Double, _ height: Double) {
//        
//        super.init(frame: CGRect.zero)
//        self.A = A
//        self.omega = omega
//        self.fi = fi
//        self.height  = height
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //y=Asin（ωx+φ）+h
    
    override func draw(_ rect: CGRect) {
        
        self.b = self.b + self.fi
        let contextRef = UIGraphicsGetCurrentContext()
        let pathRef = CGMutablePath()
        contextRef!.setLineWidth(1)
        
        let blue = UIColor.blue
        contextRef!.setFillColor(blue.cgColor);
        
        let begin = CGPoint.init(x: 0, y: self.height)
        pathRef.move(to: begin)

        let from = 0;
        let to = Int(rect.size.width)
        
        for index in from...to  {
            
            let wx = self.omega * Double(index) *  Double.pi / 180
            let Y = Double(self.A) * Double(sinf(Float(wx + self.b
            ))) + self.height
            
            pathRef.addLine(to: CGPoint.init(x: Double(index), y: Y))
        }
        
        pathRef.addLine(to: CGPoint.init(x: rect.size.width, y: rect.size.height))
        pathRef.addLine(to: CGPoint.init(x: 0, y: rect.size.height))
        contextRef?.addPath(pathRef)
        contextRef?.fillPath()
        contextRef?.drawPath(using: .stroke)
    }
    
    func upateAnimation() {
        
    }
    
    func startAnimation() {
        
        self.setNeedsDisplay()
    }
    
    func createTimer() {
        
        guard self.link != nil else {
            self.link = CADisplayLink.init(target: self, selector: #selector(startAnimation))
            self.link?.add(to: RunLoop.current, forMode: .commonModes)
            
            return
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
