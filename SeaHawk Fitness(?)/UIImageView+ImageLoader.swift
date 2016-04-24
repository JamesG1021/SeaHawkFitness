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
    func loadImageFromURL(imageName:String, imageSize:String)
    {
        let session = NSURLSession.sharedSession()
        let imageServiceURL = "http://webdev.cislabs.uncw.edu/~wj8170/SeahawkFitness/API/ImageService.php"
        //let postString = RequestARGs.dataUsingEncoding(NSUTF8StringEncoding)
        
       let requestPath = imageServiceURL + "?name=" + imageName + "&size=" + imageSize
        //print(requestPath)
        
        let imgURL: NSURL = NSURL(string: requestPath)!
        let request = NSMutableURLRequest(URL: imgURL)

        session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            if error == nil {
                self.image = UIImage(data: data!)
            }
        })
    }
}