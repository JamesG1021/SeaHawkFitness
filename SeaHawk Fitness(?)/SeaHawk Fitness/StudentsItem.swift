//
//  StudentsItem.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones, James Stinson Gray, Amanda Harman on 4/18/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation

// Parses created JSON file for the studentID and "name" values and adds them to a list.
class Student{
    var studentID: NSInteger!
    var name: String!
    
    required init(json: JSON){
        studentID = json["studentID"].intValue
        name = json["name"].stringValue
        
    }
}