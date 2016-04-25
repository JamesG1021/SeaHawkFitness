//
//  rentalsItem.swift
//  SeaHawk Fitness
//
//  Created by James S. Gray, Weston E Jones, Amanda Harman on 4/1/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation
import UIKit

// Parses the Rentals JSON file for the equipID, equipName and equipPrice and stores them into a list. As well retrives the image used in the cell for the rentals page from the webdev server. 
class Rentals
{

    var equipID: NSInteger!
    var equipName: String!
    var equipPrice : NSInteger!
    var equipImage : UIImage!
    
    let imageDirectoryURL = "http://webdev.cislabs.uncw.edu/~jsg6998/SeahawkFitness/Images/"
    
    required init(json: JSON)
    {
        equipID = json["equipID"].intValue
        equipName = json["equipName"].stringValue
        equipPrice = json["equipPrice"].intValue

        let requestPath = imageDirectoryURL + equipName.removeWhitespace() + ".jpg"
        let url = NSURL(string: requestPath)!
        let data = NSData(contentsOfURL: url)!
        
        equipImage = UIImage(data : data)
        equipImage = equipImage.scaleUIImageToSize(equipImage, size: CGSizeMake(150, 150))
    }
}
