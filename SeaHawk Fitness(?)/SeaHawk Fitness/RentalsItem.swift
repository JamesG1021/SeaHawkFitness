//
//  rentalsItem.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/1/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation

class Rentals
{
    var equipID: NSInteger!
    var equipName: String!
    
    required init(json: JSON)
    {
        equipID = json["equipID"].intValue
        equipName = json["equipName"].stringValue
    }
}
