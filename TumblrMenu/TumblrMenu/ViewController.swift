//
//  ViewController.swift
//  TumblrMenu
//
//  Created by Qi Xin on 15/6/2017.
//  Copyright © 2017 Omni_Hsin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak internal var postBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    //Mark: Event


    @IBAction func gotoPostPage(_ sender: Any) {
        
        self.performSegue(withIdentifier: "gotoMenuViewControllerIdentifier", sender: nil)
    }
    
    @IBAction func unwindToMainViewController (_ sender: UIStoryboardSegue){
        
    }
}

