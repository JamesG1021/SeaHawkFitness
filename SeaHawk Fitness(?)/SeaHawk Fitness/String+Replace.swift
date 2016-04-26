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
    // replaces the current string with a replacement.
    // parameter string: The original string 
    // parameter replacementString: The string to be substitued for the original
    func replace(string:String, replacementString: String) -> String
    {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacementString, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    // removes whitespace from strings
    func removeWhitespace() -> String {
        return self.replace(" ", replacementString: "")
    }
    // replaces white space with underscores on strings
    func makeUnderscored() -> String {
        return self.replace(" ", replacementString: "_")
    }
    
}