//
//  HoursViewController.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/24/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class HoursViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var ScrollView: UIScrollView!
    @IBOutlet var HoursView: UIImageView!
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        self.ScrollView.minimumZoomScale = 1.0
        self.ScrollView.maximumZoomScale = 6.0

        let contentArea = UIImage(named: "ContentArea")!
        view.backgroundColor = UIColor(patternImage: contentArea.scaleUIImageToSize(contentArea, size: CGSizeMake(screenWidth, screenHeight)))
        
        ScrollView.layer.cornerRadius = 8
        ScrollView.layer.masksToBounds = true
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.HoursView
    }
}
