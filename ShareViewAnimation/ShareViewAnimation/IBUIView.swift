//
//  IBUIView.swift
//  ShareViewAnimation
//
//  Created by Qi Xin on 23/8/2017.
//  Copyright © 2017 Qi Xin. All rights reserved.
//

import UIKit

@IBDesignable

class IBUIView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet {
            
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        
        didSet {
            
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        
        didSet {
            
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var masksToBounds: Bool = true {
        
        didSet {
            
            self.layer.masksToBounds = masksToBounds
        }
    }
}
