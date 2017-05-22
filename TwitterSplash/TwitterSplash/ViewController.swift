//
//  ViewController.swift
//  TwitterSplash
//
//  Created by Qi Xin on 22/5/2017.
//  Copyright © 2017 omni_Hsin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    var mask: CALayer?
    var backgroud: CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        backgroud = CALayer.init();
        backgroud?.backgroundColor = UIColor.init(red: 0.117, green: 0.631, blue: 0.949, alpha: 1.0).cgColor
        backgroud?.frame = self.view.frame
        self.view.layer.addSublayer(self.backgroud!)
        
        self.mask = CALayer.init()
        self.mask?.contents = UIImage.init(named: "twitter_logo_mask")?.cgImage
        self.mask?.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 80)
        self.mask?.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        self.mask?.position = CGPoint.init(x: (UIScreen.main.bounds.size.width) / 2.0, y: (UIScreen.main.bounds.size.height) / 2.0)
        playTweeterAnimation()
        self.view.layer.addSublayer(self.mask!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playTweeterAnimation() {
        
        let keyFrameAnimation = CAKeyframeAnimation.init(keyPath: "bounds")
        keyFrameAnimation.duration = 0.6
        keyFrameAnimation.delegate = self
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut), CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)]
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
        
        let initial = NSValue.init(cgRect: CGRect.init(x: 0, y: 0, width: self.view.bounds.width / 2, height: self.view.bounds.height / 2))
        let secondState = NSValue.init(cgRect: CGRect.init(x: 0, y: 0, width: 80, height: 64))
        let thirdState = NSValue.init(cgRect: CGRect.init(x: 0, y: 0, width: 1600, height: 1280))
        
        keyFrameAnimation.values = [initial, secondState, thirdState]
        keyFrameAnimation.keyTimes = [0, 0.3, 1.0]
        
        self.mask?.add(keyFrameAnimation, forKey: "bounds")
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        self.backgroud?.removeFromSuperlayer()
        
        self.mask?.removeFromSuperlayer()
    }

}

