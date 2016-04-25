//
//  EventsCollectionViewCell.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/19/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

// initializes the events cell with the proper labels.
class EventsCell: UICollectionViewCell{
    
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    
    //***
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.backgroundColor = UIColor(red: 238/255, green: 240/255, blue: 245/255, alpha: 255/255).CGColor
        layer.borderColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 255/255).CGColor
        
        layer.borderWidth = 2
        layer.cornerRadius = 16
        
        layer.frame.size.height = super.frame.height
        layer.frame.size.width = super.frame.width
    }
    
    let imageDirectoryURL = "http://webdev.cislabs.uncw.edu/~wj8170/SeahawkFitness/Images/"
    
    // Populates the cell with the correct data
    // parameter name: The name of the event
    // parameter date: the date of the event
    // parameter time: the time that the event is being held
    // parameter image: the image to be used for the cell stored on the server.
    func setupCell(name: String!, date: String!, time: String!, image: UIImage!){
    
        eventName.text = name
        eventName.font = UIFont.boldSystemFontOfSize(18)
        
        eventDate.text = date
        eventDate.font = UIFont.boldSystemFontOfSize(18)
        
        eventTime.text = time
        eventTime.font = UIFont.systemFontOfSize(15)
        
        eventImage.image = UIImage.init(named: "NoImageFound.jpg")
        eventImage.layer.cornerRadius = 10
        eventImage.layer.borderWidth = 1
        eventImage.layer.borderColor = UIColor(red: 110/255, green: 110/255, blue: 110/255, alpha: 255/255).CGColor
        eventImage.layer.masksToBounds = true
        
        eventImage.image = image
        eventImage.contentMode = UIViewContentMode.ScaleAspectFit
        print ("Image Size:" , eventImage.image!.size)
        
    }
    
    
    
}
