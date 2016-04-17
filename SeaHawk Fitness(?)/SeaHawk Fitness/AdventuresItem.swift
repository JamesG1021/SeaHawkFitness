//
//  GroupExerciseScheduleItem.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 3/31/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation

class AdventuresTrip
{
    var name: String!
    var day: String!
    var time: String!
    var description: String!
    var instructorID: NSInteger!
    var enrolled: NSInteger!
    var capacity: NSInteger!
    
    required init(json: JSON) {
        name = json["name"].stringValue
        day = json["day"].stringValue
        time = json["time"].stringValue
        description = json["description"].stringValue
        instructorID = json["instructorID"].intValue
        enrolled = json["enrolled"].intValue
        capacity = json["capacity"].intValue
    }
    
    // TODO: Implement Casting of time String to NSDate based format.
    // TODO: Implement Casting of day String to NSDate based format.
    
    
}
