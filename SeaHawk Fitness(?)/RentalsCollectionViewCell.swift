//
//  RentalsCollectionViewCell.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/17/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

// Initializes the collection view and all labels needed for the page.
class RentalsCollectionCell : UICollectionViewCell
{
    
    @IBOutlet var FRONT: UIView!
    @IBOutlet var BACK: UIView!
    
    @IBOutlet weak var rentalImage: UIImageView!
    @IBOutlet weak var rentalName: UILabel!
    @IBOutlet weak var rentalPrice: UILabel!
    
    @IBOutlet weak var ReserveNowButton: UIButton!
    
    var showingBack = false
    var initNumber:Int = 0
    
    /*
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let singleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tapped")
        
        singleTap.numberOfTouchesRequired = 1
        
        self.contentView.addGestureRecognizer(singleTap)
        self.contentView.userInteractionEnabled = true
        
    }
    */
    
    //***
    override func awakeFromNib() {
        layer.frame.size.height = super.frame.height
        layer.frame.size.width = super.frame.width
        
        FRONT.layer.backgroundColor = UIColor(red: 238/255, green: 240/255, blue: 243/255, alpha: 255/255).CGColor
        FRONT.layer.borderColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 255/255).CGColor
        FRONT.layer.borderWidth = 3
        FRONT.layer.cornerRadius = 15
        
        BACK.layer.backgroundColor =  UIColor(red: 238/255, green: 240/255, blue: 243/255, alpha: 255/255).CGColor
        BACK.layer.borderColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 255/255).CGColor
        BACK.layer.borderWidth = 3
        BACK.layer.cornerRadius = 15
        
    }
    
    // Populates the cell with the correct information
    // parameter name: name of the equipment
    // parameter price: price of the rental
    // parameter image: The correct image for the equipment stored on the server.
    func setupCell(name: String!, price: Int!, image: UIImage!)
    {
        let cellWidth = self.frame.width
        let cellHeight = self.frame.height
        print ("Cell Width: ",cellWidth)
        print ("Cell Height: ",cellHeight)
        
        self.backgroundColor = UIColor.clearColor()
        
        FRONT.layer.backgroundColor = UIColor(red: 238/255, green: 240/255, blue: 243/255, alpha: 255/255).CGColor
        FRONT.layer.borderColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 255/255).CGColor
        FRONT.layer.borderWidth = 3
        FRONT.layer.cornerRadius = 15
        
        BACK.layer.backgroundColor =  UIColor(red: 238/255, green: 240/255, blue: 243/255, alpha: 255/255).CGColor
        BACK.layer.borderColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 255/255).CGColor
        BACK.layer.borderWidth = 3
        BACK.layer.cornerRadius = 15
        
        
        rentalImage.image = UIImage.init(named: "NoImageFound.jpg")
        rentalImage.layer.cornerRadius = 10
        rentalImage.layer.borderWidth = 1
        rentalImage.layer.borderColor = UIColor(red: 110/255, green: 110/255, blue: 110/255, alpha: 255/255).CGColor
        rentalImage.layer.masksToBounds = true
        
        rentalImage.image = image
        rentalImage.contentMode = UIViewContentMode.ScaleAspectFit
        print ("Image Size:" , rentalImage.image!.size)
        
        rentalName.text = name
        rentalName.font = UIFont.boldSystemFontOfSize(18)
        
        rentalPrice.text = "$ " + String(price)
        rentalPrice.font = UIFont.systemFontOfSize(15)
        rentalPrice.textColor = UIColor.grayColor()
        
        ReserveNowButton.backgroundColor = UIColor(red: 225/255, green: 244/255, blue: 220/255, alpha: 255/255)
        ReserveNowButton.layer.cornerRadius = 25
        
    }
    
    // used to determine if the item has been tapped or not
    func tapped() {
        
        if showingBack {
            NSLog("showBack")
            UIView.transitionFromView(BACK, toView: FRONT, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            
            showingBack = false
            
        } else {
            UIView.transitionFromView(FRONT, toView: BACK, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            
            showingBack = true

        }
    }
    
    // Button to reserve the equipment for rentals.
    @IBAction func ReserveNowButton(sender: AnyObject) {
    }
}
