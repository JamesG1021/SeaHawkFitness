//
//  Instructor.swift
//  SeaHawk Fitness
//
//  Created by James S. Gray, Weston E Jones, Amanda Harman on 4/1/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation

// Parses the JSON file "Instructor" and stores the InstructorID and the "name" in a list.
class Instructor
{
    var instructorID: String!
    var name: String!
    
    required init(json: JSON)
    {
        instructorID = json["instructorID"].stringValue
        name = json["name"].stringValue
    }
}