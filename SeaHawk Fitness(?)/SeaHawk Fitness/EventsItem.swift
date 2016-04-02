//
//  eventsItem.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/1/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//
import Foundation

class LargeEvent
{
    var eventId: NSInteger!
    var time: String!
    var day: String!
    var description: String!
    var eventName: String!
    
    required init(json: JSON) {
        eventId = json["courseID"].intValue
        time = json["time"].stringValue
        day = json["day"].stringValue
        description = json["description"].stringValue
        eventName = json["eventName"].stringValue
    }
    
    // TODO: Implement Casting of time String to NSDate based format.
    
}
