//
//  ViewController.swift
//  SimpleCounter
//
//  Created by Qi Xin on 17/5/2017.
//  Copyright © 2017 omni_Hsin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sa: UITextField!
    @IBOutlet weak var genderSelector: UISegmentedControl!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var NameInput: UITextField!
    var counter: Int = 0
    
    var timer = Timer()
    @IBOutlet weak var salaryLab: UILabel!
    @IBOutlet weak var genderSelector: UISegmentedControl!
    
    var isPlaying = false
    
    @IBOutlet weak var countDisplay: UILabel!
    
    @IBOutlet weak var counterBtn: UILabel!
    @IBAction func chooseSalary(_ sender: Any) {
    }
    
    @IBAction func tapToCount(_ sender: Any) {
        
        counter = 0
        
        @IBAction func chooseSalary(_ sender: Any) {
        }
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

