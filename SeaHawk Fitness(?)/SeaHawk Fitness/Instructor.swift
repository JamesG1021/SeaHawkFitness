//
//  Instructor.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/1/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation

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