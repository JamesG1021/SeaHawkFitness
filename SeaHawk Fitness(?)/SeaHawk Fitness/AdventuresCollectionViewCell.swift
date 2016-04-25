//
//  AdventuresCollectionViewCell.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/19/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit
// initializes the collection view cells and the labels that will corespond to the information.
class AdventuresCollectionCell: UICollectionViewCell
{
    @IBOutlet weak var adventureImage: UIImageView!
    @IBOutlet weak var adventureName: UILabel!
    @IBOutlet weak var adventureDate: UILabel!
    @IBOutlet weak var adventurePrice: UILabel!
    
    // specifies the nib that will be used for each cell
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
    
    // populates the cell with the correct data and image
    // parameter name: the name of the adventure
    // parameter date: the date of the adventure
    // parameter price: the price of the adventure
    // parameter image: the uiImage that is stored on the server that correseponds to this adventure.
    func setupCell(name: String!, date: String!, price: Int!, image: UIImage!){

        adventureName.text = name
        adventureName.font = UIFont.boldSystemFontOfSize(18)
        
        adventureDate.text = date
        adventureDate.font = UIFont.boldSystemFontOfSize(18)
        
        adventurePrice.text = String(price)
        adventurePrice.font = UIFont.systemFontOfSize(15)
        adventurePrice.textColor = UIColor.grayColor()
        
        adventureImage.image = UIImage.init(named: "NoImageFound.jpg")
        adventureImage.layer.cornerRadius = 10
        adventureImage.layer.borderWidth = 1
        adventureImage.layer.borderColor = UIColor(red: 110/255, green: 110/255, blue: 110/255, alpha: 255/255).CGColor
        adventureImage.layer.masksToBounds = true
        
        adventureImage.image = image
        adventureImage.contentMode = UIViewContentMode.ScaleAspectFit
        print ("Image Size:" , adventureImage.image!.size)
    }
    
}