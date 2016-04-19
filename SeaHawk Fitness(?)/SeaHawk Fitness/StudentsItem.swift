//
//  StudentsItem.swift
//  SeaHawk Fitness
//
//  Created by Amanda Harman on 4/18/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation

class Students{
    var studentID: NSInteger!
    var name: String!
    
    required init(json: JSON){
        studentID = json["studentID"].intValue
        name = json["name"].stringValue
        
    }
}