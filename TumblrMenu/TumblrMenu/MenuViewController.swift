//
//  MenuViewController.swift
//  TumblrMenu
//
//  Created by Qi Xin on 15/6/2017.
//  Copyright © 2017 Omni_Hsin. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var leftContainer: UIView!
    
    @IBOutlet weak var rightContainer: UIView!
    
    
    var trasitionDelegate = MenuTransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.transitioningDelegate = self.trasitionDelegate
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    @IBAction func backToMainPage(_ sender: Any) {
        
        self.performSegue(withIdentifier: "unwindToMainViewController", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
