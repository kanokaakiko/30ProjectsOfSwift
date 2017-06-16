//
//  MenuAnimationManager.swift
//  TumblrMenu
//
//  Created by Qi Xin on 15/6/2017.
//  Copyright © 2017 Omni_Hsin. All rights reserved.
//

import UIKit

class MenuTransitionManager: NSObject ,UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning{

    var presenting = false
    
    
    //Mark: Pravte
    func onStageMenuController(_ controller: MenuViewController) {
        
        controller.view.alpha = 1.0
        
        controller.leftContainer.transform = CGAffineTransform.identity
        controller.rightContainer.transform = CGAffineTransform.identity
    }
    
    func offStageMenuController(_ controller: MenuViewController ,_ animated: Bool) {
        
        if animated {
            controller.view.alpha = 0.0
        }

        controller.leftContainer.transform = CGAffineTransform.init(translationX: -500, y: 0)
        controller.rightContainer.transform = CGAffineTransform.init(translationX: 500, y: 0)
        
        controller.leftContainer.transform = CGAffineTransform.init(rotationAngle: -45)
        controller.rightContainer.transform  = CGAffineTransform.init(rotationAngle: 45)
    }
    
    //Mark: UIViewControllerDeleagte
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
        self.presenting = true
        
        return self
    }
    
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
        self.presenting = false
        
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    
        return 1.0
    }
    
    // This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    
        let container = transitionContext.containerView
        
        let screens : (from:UIViewController, to:UIViewController) = (transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)!, transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!)
        
        let menuViewController = !self.presenting ? screens.from as! MenuViewController : screens.to as! MenuViewController
        let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView = menuViewController.view
        let bottomView = bottomViewController.view
        
        //Firstly we set the original postion off the screen
        if (self.presenting) {
            
            self.offStageMenuController(menuViewController, false)
        }
        
        container.addSubview(bottomView!)
        container.addSubview(menuView!)
        
        let duration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: {
            
            if (self.presenting){
                
                self.onStageMenuController(menuViewController)
                
            } else {
                
                self.offStageMenuController(menuViewController, true)
            }
            
        }, completion: { finished in
            
            transitionContext.completeTransition(true)
            UIApplication.shared.keyWindow!.addSubview(screens.to.view)
            
        })
    }
}
