//
//  MakeRequest.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/19/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation
import UIKit

func makeDatabaseRequest(sender: UIView, API: NSString, EditARGs: NSString, RequestARGs: NSString) {
    let RequestVariables = ((EditARGs as String) + "=true&") + (RequestARGs as String)
    
    JSONService.sharedInstance.getJSON (API, ReqARGs: RequestVariables, onCompletion: { (json: JSON) in
        if let results = json.array {
            for entry in results {
                if (EditARGs == "insertion" || EditARGs == "deletion") {
                    print(entry)
                } else {
                    if (API == "RentalService") {
                        RentalItems.append(Rentals(json : entry))
                    } else if (API == "TrainersService") {
                        InstructorsItems.append(Instructor(json : entry))
                    } else if (API == "StudentService") {
                        StudentsItems.append(Student(json : entry))
                    } else if (API == "GroupExerciseService") {
                        ExerciseClassItems.append(GroupExerciseClass(json : entry))
                    } else if (API == "EventsService") {
                        EventsItems.append(Event(json : entry))
                    } else if (API == "AdventuresService") {
                        AdventuresItems.append(AdventuresTrip(json : entry))
                    } else {
                        print("Something Went very Wrong")
                    }
                    
                }
            }
            dispatch_async(dispatch_get_main_queue(),{
                NSNotificationCenter.defaultCenter().postNotificationName("refreshMyData", object: nil)
                //sender.addSubview(<#T##view: UIView##UIView#>)
            })
        }
    })
}