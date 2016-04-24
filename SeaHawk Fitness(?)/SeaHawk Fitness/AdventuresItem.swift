//
//  GroupExerciseScheduleItem.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 3/31/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation
import UIKit

class AdventuresTrip
{
    var name: String!
    var day: String!
    var time: String!
    var description: String!
    var instructorID: NSInteger!
    var enrolled: NSInteger!
    var capacity: NSInteger!
    var adventureImage: UIImage!
    
    let imageDirectoryURL = "http://webdev.cislabs.uncw.edu/~jsg6998/SeahawkFitness/Images/"
    
    required init(json: JSON) {
        name = json["name"].stringValue
        day = json["day"].stringValue
        time = json["time"].stringValue
        description = json["description"].stringValue
        instructorID = json["instructorID"].intValue
        enrolled = json["enrolled"].intValue
        capacity = json["capacity"].intValue
        
        let requestPath = imageDirectoryURL + name.removeWhitespace() + ".jpg"
        let url = NSURL(string: requestPath)!
        let data = NSData(contentsOfURL: url)!
        
        adventureImage = UIImage(data : data)
        adventureImage = adventureImage.scaleUIImageToSize(adventureImage, size: CGSizeMake(520, 300))
    }
    
    // TODO: Implement Casting of time String to NSDate based format.
    // TODO: Implement Casting of day String to NSDate based format.
    
}
