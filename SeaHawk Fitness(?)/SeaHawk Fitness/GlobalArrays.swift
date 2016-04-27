//
//  GlobalArrays.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones, James Stinson Gray  on 4/1/16
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import Foundation

// Creates Global Arrays of data read in from the JSON file to be used throughout the app. More efficient than having each page parse the data on it's own.
var RentalItems = [Rentals]()
var ExerciseClassItems = [GroupExerciseClass]()
var AdventuresItems = [AdventuresTrip]()
var StudentsItems = [Student]()
var EventsItems = [Event]()
var InstructorsItems = [Instructor]()
