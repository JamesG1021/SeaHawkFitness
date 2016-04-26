//
//  UIImage+ImageLoader.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/16/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation
import UIKit

extension UIImage
{
    // Scales the image to the correct size for the device
    // parameter image: the ui image to be used
    // parameter siz: the size that the image needs to be.
    func scaleUIImageToSize(let image: UIImage, let size: CGSize) -> UIImage {
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        image.drawInRect(CGRect(origin: CGPointZero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
}