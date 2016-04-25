//
//  eventsItem.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones, James Stinson Gray, Amanda Harman on 4/1/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//
import Foundation
import UIKit


// Parses the JSON created for the events page for the  eventID, time, day, description and eventName and stores the information into a list. As well as connnects to the webdev server to fetch correct eventImage.
class Event
{
    var eventId: NSInteger!
    var time: String!
    var day: String!
    var description: String!
    var eventName: String!
    var eventImage: UIImage!
    
    let imageDirectoryURL = "http://webdev.cislabs.uncw.edu/~jsg6998/SeahawkFitness/Images/"
    
    required init(json: JSON) {
        eventId = json["courseID"].intValue
        time = json["time"].stringValue
        day = json["day"].stringValue
        description = json["description"].stringValue
        eventName = json["eventName"].stringValue
        
        let requestPath = imageDirectoryURL + eventName.removeWhitespace() + ".jpg"
        let url = NSURL(string: requestPath)!
        let data = NSData(contentsOfURL: url)!
        
        eventImage = UIImage(data : data)
        eventImage = eventImage.scaleUIImageToSize(eventImage, size: CGSizeMake(560, 300))
    }
    
    
    // TODO: Implement Casting of time String to NSDate based format.
    
}
