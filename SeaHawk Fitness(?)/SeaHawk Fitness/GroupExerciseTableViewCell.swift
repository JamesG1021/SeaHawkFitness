//
//  GroupExerciseTableViewCell.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/24/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit
// Initialzies the table view cels and the labels that will relate to the data populating the cells.
class ExerciseClassCell : UITableViewCell
{
    
    @IBOutlet weak var ExerciseClassName: UILabel!
    @IBOutlet weak var ExerciseClassTimeframe: UILabel!
    @IBOutlet weak var ExerciseClassLocation: UILabel!
    //@IBOutlet weak var ExerciseClassDescription: UITextView!
    
    
    // Puts the information pertaining to each cell in the correct place.
    // parameter name: the name of the group exercise
    // parameter time: the time the exercise takes place
    // parameter location: the studio in which the exercise will take place.
    // parameter description: A string describing the course that is being viewed.
    func setupCell(name: String!, timeFrame: String!, location: String!, description: String!)
    {
        // Add end time to create a time range.
        
        let baseCell = UIImage(named: "BaseCell")!
        self.backgroundColor = UIColor(patternImage: baseCell.scaleUIImageToSize(baseCell, size: CGSizeMake(354, 62)))
        
        //ExerciseClassDescription.text = description
        //ExerciseClassDescription.hidden = true
        
        ExerciseClassName.text = name
        ExerciseClassName.font = UIFont.boldSystemFontOfSize(18)
        
        ExerciseClassTimeframe.text = timeFrame
        ExerciseClassTimeframe.textColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 255/255)
        ExerciseClassTimeframe.font = UIFont.italicSystemFontOfSize(18)
        
        ExerciseClassLocation.text = location
        ExerciseClassLocation.textColor = UIColor.grayColor()
        ExerciseClassLocation.font = UIFont.systemFontOfSize(15)
        
        self.contentView.clipsToBounds = true;
        
    }
}

// creates the tableview that will hold the description for the course.
class ClassDescriptionCell : UITableViewCell
{
    @IBOutlet weak var ClassDescription: UITextView!
    
    @IBOutlet weak var MinimizeArrow: UIImageView!
    
    func setupCell(description: String!)
    {
        
    }
}
