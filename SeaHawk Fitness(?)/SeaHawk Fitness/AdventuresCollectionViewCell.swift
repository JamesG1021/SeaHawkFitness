//
//  AdventuresCollectionViewCell.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/19/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class AdventuresCollectionCell: UICollectionViewCell
{
    @IBOutlet weak var adventureImage: UIImageView!
    @IBOutlet weak var adventureName: UILabel!
    @IBOutlet weak var adventureDate: UILabel!
    @IBOutlet weak var adventurePrice: UILabel!
    
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
    
    func setupCell(name: String!, date: String!, price: Int!){
        //let imagePath = imageDirectoryURL + name.removeWhitespace() + ".jpg"
        
        //adventureImage.loadImageFromURL(imagePath)
        adventureName.text = name
        adventureName.font = UIFont.boldSystemFontOfSize(18)
        
        adventureDate.text = date
        adventureDate.font = UIFont.boldSystemFontOfSize(18)
        
        adventurePrice.text = String(price)
        adventurePrice.font = UIFont.systemFontOfSize(15)
        adventurePrice.textColor = UIColor.grayColor()
    }
    
}