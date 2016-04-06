//
//  String+Replace.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/5/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation

extension String
{
    func replace(string:String, replacementString: String) -> String
    {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacementString, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(" ", replacementString: "")
    }
    
    func makeUnderscored() -> String {
        return self.replace(" ", replacementString: "_")
    }
    
}