//
//  RentalsCollectionViewFlowLayout.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/17/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class RentalsCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    // Setup Cell spacing and scroll Direction
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        
        scrollDirection = .Vertical
    }
    
    // Designate Cell Item Size
    override var itemSize: CGSize {
        set {
            
        }
        get {
            let numberOfColumns: CGFloat = 2
            let numberOfRows: CGFloat = 2.4
            
            let itemWidth = (CGRectGetWidth(self.collectionView!.frame) - (numberOfColumns - 1)) / numberOfColumns
            let itemHeight = (CGRectGetHeight(self.collectionView!.frame) - (numberOfRows - 1)) / numberOfRows
            
            print("Width: ", itemWidth, "Height: ", itemHeight)
            return CGSizeMake(itemWidth, itemHeight)
        }
    }
    
}
