//
//  EventsCollectionViewCell.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/19/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class EventsCell: UICollectionViewCell{
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.backgroundColor = UIColor(red: 208/255, green: 240/255, blue: 220/255, alpha: 255/255).CGColor
        layer.borderColor = UIColor(red: 178/255, green: 244/255, blue: 220/255, alpha: 255/255).CGColor
        layer.borderWidth = 2
        layer.cornerRadius = 12
        layer.frame.size.height = super.frame.height
        layer.frame.size.height = super.frame.width
    }
    
    let imageDirectoryURL = "http://webdev.cislabs.uncw.edu/~wj8170/SeahawkFitness/Images/"
    
    
    func setupCell(name: String!, date: String!, time: String!){
        //let imagePath = imageDirectoryURL + name.removeWhitespace() + ".jpg"
        //eventImage.loadImageFromURL(imagePath)

        
        eventName.text = name
        eventName.font = UIFont.boldSystemFontOfSize(18)
        
        eventDate.text = date
        eventDate.font = UIFont.boldSystemFontOfSize(18)
        
        eventTime.text = time
        eventTime.font = UIFont.systemFontOfSize(15)
        
    }
    
}
