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

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

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

    //Mark: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colletionItems?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.cellIdentifier, for: indexPath) as? AnimatedCollectionCell, let model = colletionItems?.images[indexPath.item] else {
            
            return UICollectionViewCell()
        }
        
        cell.configCell(model)
        
        return cell;
    }

    //Mark: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? AnimatedCollectionCell else {
            return
        }
        
        self.handleCellAnimation(collectionView, cell)
    }
    
    //Mark: UICollectionViewDelegateFlowLayout
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//    
//        return CGSize.zero
//    }
    //Mark: Private
    fileprivate func handleCellAnimation(_ collectionView: UICollectionView, _ cell: AnimatedCollectionCell) {
    
        cell.handleCellSelection()
        cell.backButtonTapped = self.cellBackButtonTouched
        let animation: () -> () = {
            
            cell.frame = collectionView.bounds
        }
    
        let completion: (_ completed: Bool) -> () = { _ in
        
            collectionView.isScrollEnabled = false
        }
    
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [], animations: animation, completion: completion)
    }
    
    func cellBackButtonTouched() {
        
        guard let indexpaths = animationCollection.indexPathsForSelectedItems else {
            
            return
        }
        animationCollection.isScrollEnabled = true
        animationCollection.reloadItems(at: indexpaths)
    }
}

