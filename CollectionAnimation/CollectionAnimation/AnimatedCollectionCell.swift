//
//  AnimatedCollectionCell.swift
//  CollectionAnimation
//
//  Created by Qi Xin on 1/6/2017.
//  Copyright © 2017 omni_Hsin. All rights reserved.
//

import UIKit

class AnimatedCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var infoDisplay: UILabel!
    
    var backButtonTapped: (() -> Void)?
    
    func configCell(_ cellInfo: ColletionCellModel) {
        
        imageView.image = UIImage(named: cellInfo.imagePath)
        
        backButton.isHidden = true

        backButton.addTarget(self, action: #selector(backButtonDidTouched), for: .touchUpInside)
    }
    
    func backButtonDidTouched(_ sender:UIGestureRecognizer){
        
        backButtonTapped?()
    }
    
    func handleCellSelection(){
        
        self.superview?.bringSubview(toFront: self)
        
        backButton.isHidden = false
    }
}
