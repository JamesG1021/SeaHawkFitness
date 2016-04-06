//
//  UIImage+ImageLoader.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/5/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView
{
    func loadImageFromURL(imagePath:String)
    {
        let session = NSURLSession.sharedSession()
        
        let imgURL: NSURL = NSURL(string: imagePath)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            if error == nil {
                self.image = UIImage(data: data!)
            }
        })
    }
}