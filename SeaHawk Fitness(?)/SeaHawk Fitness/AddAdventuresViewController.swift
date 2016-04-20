//
//  AddAdventuresViewController.swift
//  SeaHawk Fitness
//
//  Created by Amanda Harman on 4/18/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class AddAdventuresViewController: UIViewController {
    
    @IBOutlet weak var adventureID: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var instructorIDLabel: UILabel!
    @IBOutlet weak var enrolledLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var adventureIDField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dayField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var instructorIDField: UITextField!
    @IBOutlet weak var enrolledField: UITextField!
    @IBOutlet weak var capacityField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    


    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        messageLabel.text = "Status message will go here"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonPresssed(sender: UIButton) {
    }
    
    

    @IBAction func cancelButtonPressed(sender: UIButton) {
    }
    @IBAction func submitButtonPressed(sender: UIButton) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
