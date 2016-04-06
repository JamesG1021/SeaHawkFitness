//
//  ImageLoader.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/5/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation

func load_image(imageName:String)
{
    let imageDirectoryURL = "http://webdev.cislabs.uncw.edu/~wj8170/SeahawkFitness/Images/"
    let session = NSURLSession.sharedSession()
    
    let imagePath = imageDirectoryURL + imageName + ".jpg"
    
    var imgURL: NSURL = NSURL(string: imagePath)!
    let request: NSURLRequest = NSURLRequest(URL: imgURL)
    session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
        if error == nil {
            self.image_element.image = UIImage(data: data)
        }
    })
    
}