//
//  GroupExerciseScheduleItem.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones, James Stinson Gray, Amanda Harman on 3/31/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation

//Creates a list by parsing the JSON file created by PHP and populates it with the courseID, courseName, startTime, endTime, studio, description, day and timeFrame values.
class GroupExerciseClass
{
    var courseID: NSInteger!
    var courseName: String!
    var startTime: String!
    var endTime: String!
    var studio: String!
    var description: String!
    var day: String!
    var timeFrame: String!
    
    required init(json: JSON) {
        courseID = json["courseID"].intValue
        courseName = json["courseName"].stringValue
        startTime = json["startTime"].stringValue
        endTime = json["endTime"].stringValue
        studio = json["studio"].stringValue
        description = json["description"].stringValue
        day = json["day"].stringValue
        
        timeFrame = startTime + " - " + endTime
    }
    
    
    // TODO: Implement Casting of time String to NSDate based format.
    
}
