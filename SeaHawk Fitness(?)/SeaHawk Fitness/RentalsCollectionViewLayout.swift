//
//  RentalsCollectionViewLayout.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/5/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

protocol RentalsCollectionViewLayoutDelegate
{
    func collectionView(collectionView: UICollectionViewCell, heightForPhotoAtIndexPath indexPath:NSIndexPath,
                        withWidth:CGFloat) -> CGFloat
    
    func collectionView(collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat
}

class RentalsCollectionViewLayout: UICollectionViewLayout {

}
