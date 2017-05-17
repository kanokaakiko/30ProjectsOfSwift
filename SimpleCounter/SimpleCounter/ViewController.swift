//
//  ViewController.swift
//  SimpleCounter
//
//  Created by Qi Xin on 17/5/2017.
//  Copyright © 2017 omni_Hsin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter: Int = 0
    
    var timer = Timer()
    
    var isPlaying = false
    
    @IBOutlet weak var countDisplay: UILabel!
    
    @IBOutlet weak var counterBtn: UILabel!
    
    @IBAction func tapToCount(_ sender: Any) {
        
        counter = 0
        
        timer.invalidate()
        
        if isPlaying {
            
            countDisplay.text = "\(counter)"
            
            isPlaying = false
            
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCounterDisplay), userInfo: nil, repeats: true)
        
        isPlaying = true
    }
    
    @IBAction func beginToCount(_ sender: Any) {
        
        if (sender as! UILongPressGestureRecognizer).state == .began {
            
            timer.invalidate()
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateCounterDisplay), userInfo: nil, repeats: true)
            
        }else if (sender as! UILongPressGestureRecognizer).state == .ended {
            
            timer.invalidate()
            
            countDisplay.text = "\(counter)"
        }

    }

    @IBAction func resetCounter(_ sender: Any) {
        
        timer.invalidate()
        
        counter = 0
        
        countDisplay.text = "\(counter)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCounterDisplay() {
        
        counter = counter + 1
        
        countDisplay.text = String(format:"%d",counter)
    }
}

