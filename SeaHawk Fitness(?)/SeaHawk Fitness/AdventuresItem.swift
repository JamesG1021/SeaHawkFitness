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
    
    
    required init(json: JSON) {
        name = json["courseID"].stringValue
        day = json["courseName"].stringValue
        time = json["time"].stringValue
        description = json["description"].stringValue
        instructorID = json["instructorID"].intValue
    }
    
    // TODO: Implement Casting of time String to NSDate based format.
    // TODO: Implement Casting of day String to NSDate based format.
    
    
}
