//
//  ViewController.swift
//  LoveTweet
//
//  Created by Qi Xin on 18/5/2017.
//  Copyright © 2017 omni_Hsin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Mark: outlets
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var genderSelector: UISegmentedControl!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var jobInput: UITextField!
    @IBOutlet weak var salarySlider: UISlider!
    @IBOutlet weak var salaryLab: UILabel!
    
    @IBOutlet weak var straightOrGay: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func salaryHandler(_ sender: AnyObject) {
        
        let slider = sender as! UISlider
        
        let value = Int(slider.value)
        
        salaryLab.text = "$\(value)k"
    }
    
    @IBAction func tweetIt(_ sender: AnyObject) {
        
        if nameInput.text == "" || jobInput.text == "" || salaryLab.text == "" {
            
            self.showAlert("Woop, something goes wrong", "Please full out the form completely", "OK")
            
            return
        }
    }
    
    fileprivate func showAlert(_ title: String, _ message: String, _ button: String) {
    
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction.init(title: button, style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //dismiss the keyboard
        
        super.touchesBegan(touches, with: event)
        
        self.view .endEditing(true)
    }
}

