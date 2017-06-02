//
//  ViewController.swift
//  CollectionAnimation
//
//  Created by Qi Xin on 1/6/2017.
//  Copyright © 2017 omni_Hsin. All rights reserved.
//

import UIKit

struct ColletionItems {
    fileprivate let imagePaths = ["1", "2", "3", "4"]
    
    var images: [ColletionCellModel]
    
    init() {
        images = imagePaths.map {ColletionCellModel.init(imagePath: $0)}
    }
}

struct ColletionCellModel {
    let imagePath: String
    
    init(imagePath: String?) {
        self.imagePath = imagePath ?? ""
    }
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    fileprivate struct Storyboard {
    
        static let nibName = String(describing:AnimatedCollectionCell.self)
        static let cellIdentifier = String(describing:AnimatedCollectionCell.self)
    }
    
    @IBOutlet weak var animationCollection: UICollectionView!
    
    var colletionItems: ColletionItems?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colletionItems = ColletionItems()
        
        animationCollection?.register(UINib(nibName: Storyboard.nibName, bundle: nil), forCellWithReuseIdentifier: Storyboard.cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colletionItems?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.cellIdentifier, for: indexPath) as? AnimatedCollectionCell, let model = colletionItems?.images[indexPath.item] as? ColletionCellModel else {
            
            return UICollectionViewCell()
        }
        
        return cell;
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

