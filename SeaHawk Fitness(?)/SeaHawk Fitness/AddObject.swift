//
//  AddObject.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/19/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation
import UIKit

func addObject(sender: UIView, API: NSString, RequestARGs: NSString) {    
    JSONService.sharedInstance.getJSON (API, ReqARGs: RequestARGs, onCompletion: { (json: JSON) in
        if let results = json.array {
            for entry in results {
                print(entry)
            }
            dispatch_async(dispatch_get_main_queue(),{
                //sender.addSubview(<#T##view: UIView##UIView#>)
            })
        }
    })
}