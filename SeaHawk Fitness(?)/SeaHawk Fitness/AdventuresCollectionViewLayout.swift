//
//  AdventuresCollectionViewLayout.swift
//  SeaHawk Fitness
//
//  Created by Amanda Harman on 4/6/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

protocol AdventuresCollectionViewLayoutDelegate
{
    func collectionView(collectionView: UICollectionViewCell, heightForPhotoAtIndexPath indexPath:NSIndexPath,
        withWidth:CGFloat) -> CGFloat
    
    func collectionView(collectionView: UICollectionView,
        heightForAnnotationAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat
}

class AdventuresCollectionViewLayout: UICollectionViewLayout {

}
