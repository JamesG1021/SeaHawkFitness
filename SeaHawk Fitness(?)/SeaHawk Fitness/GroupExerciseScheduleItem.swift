//
//  GroupExerciseScheduleItem.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 3/31/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation

class GroupExerciseClass
{
    var courseID: NSInteger!
    var courseName: String!
    var time: String!
    var description: String!
    var day: String!
    
    required init(json: JSON) {
        courseID = json["courseID"].intValue
        courseName = json["courseName"].stringValue
        time = json["time"].stringValue
        description = json["description"].stringValue
        day = json["day"].stringValue
    }
    
    // TODO: Implement Casting of time String to NSDate based format.
    
}
