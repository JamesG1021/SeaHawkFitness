//
//  InfoViewPopup.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/24/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit
// *** This XIB will be used to create a re-usable InfoView Popup that will be populated 
//     with data on each page that calls it
class InfoViewPopup: UIView {

    @IBOutlet var InfoTitle: UILabel!
    @IBOutlet var InfoImage: UIImageView!
    @IBOutlet var InfoDescription: UILabel!
   
    @IBAction func DismissButton(sender: AnyObject) {
    }
    
}
