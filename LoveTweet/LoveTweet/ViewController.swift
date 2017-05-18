//
//  ViewController.swift
//  LoveTweet
//
//  Created by Qi Xin on 18/5/2017.
//  Copyright © 2017 omni_Hsin. All rights reserved.
//

import UIKit
import Social
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
        
        let name: String! = nameInput.text
        let job: String! = jobInput.text
        let salary: String! = String(salarySlider.value)
        
        let gregorian = Calendar.init(identifier: Calendar.Identifier.gregorian)
        let now = Date()
        let component = (gregorian as NSCalendar?)?.components(NSCalendar.Unit.year, from: birthdayPicker.date, to: now, options: [])
        
        let age: Int? = component?.year
        
        var interested: String! = "men"
        
        if genderSelector.selectedSegmentIndex == 0 && straightOrGay.isOn || genderSelector.selectedSegmentIndex == 1 && !straightOrGay.isOn{
            
            interested = "men"
        }
        else if genderSelector.selectedSegmentIndex == 1 && straightOrGay.isOn || genderSelector.selectedSegmentIndex == 0 && !straightOrGay.isOn{
            interested = "women"
        }
        else
        {
            interested = "middle"
        }

        let tweet = "Hi, I am \(name!). As a \(age!)-year-old \(job!) earning \(salary!)/year, I am interested in \(interested!). Feel free to contact me!"
        
        tweetCompose(tweet)
    }
    
    fileprivate func showAlert(_ title: String, _ message: String, _ button: String) {
    
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction.init(title: button, style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func tweetCompose(_ tweet: String) {
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter)
        {
            let twitterController:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            twitterController.setInitialText(tweet)
            
            self.present(twitterController, animated: true, completion: nil)
        }
        else
        {
            showAlert("Twitter Unavailable", "Please configure your twitter account on device", "OK")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //dismiss the keyboard
        
        super.touchesBegan(touches, with: event)
        
        self.view .endEditing(true)
    }
}

