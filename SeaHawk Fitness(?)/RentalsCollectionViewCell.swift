//
//  RentalsCollectionViewCell.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/17/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let singleTap = UITapGestureRecognizer()
        
        singleTap.numberOfTouchesRequired = 1
        
        self.contentView.addGestureRecognizer(singleTap)
        self.contentView.userInteractionEnabled = true

        self.backgroundColor = UIColor.clearColor()
        
    }
    
    func setupCell(name: String!, price: Int!)
    {
        let cellWidth = self.frame.width
        let cellHeight = self.frame.height
        
        FRONT.layer.backgroundColor = UIColor(red: 208/255, green: 240/255, blue: 220/255, alpha: 255/255).CGColor
        FRONT.layer.borderColor = UIColor(red: 178/255, green: 244/255, blue: 220/255, alpha: 255/255).CGColor
        FRONT.layer.borderWidth = 2
        FRONT.layer.cornerRadius = 12
        
        BACK.layer.backgroundColor =  UIColor(red: 208/255, green: 240/255, blue: 220/255, alpha: 255/255).CGColor
        BACK.layer.borderColor = UIColor(red: 178/255, green: 244/255, blue: 220/255, alpha: 255/255).CGColor
        BACK.layer.borderWidth = 2
        BACK.layer.cornerRadius = 12
        
        rentalImage.image = UIImage.init(named: "NoImageFound")
        
        rentalName.text = name
        rentalName.adjustsFontSizeToFitWidth = true
        rentalPrice.adjustsFontSizeToFitWidth = true
        //rentalName.font = UIFont.boldSystemFontOfSize(18)
        
        rentalPrice.text = String(price)
        //rentalPrice.font = UIFont.systemFontOfSize(15)
        rentalPrice.textColor = UIColor.grayColor()
        
        ReserveNowButton.backgroundColor = UIColor(red: 225/255, green: 244/255, blue: 220/255, alpha: 255/255)
        ReserveNowButton.layer.cornerRadius = 25
        
    }
    
    func tapped() {
        
        if showingBack {
            NSLog("showBack")
            UIView.transitionFromView(BACK, toView: FRONT, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
            showingBack = false
        } else {
            UIView.transitionFromView(FRONT, toView: BACK, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
            showingBack = true
        }
    }
    
    @IBAction func ReserveNowButton(sender: AnyObject) {
    }
}
