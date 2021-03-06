//
//  AddAdventuresViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray on 4/19/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

// initializes the view controller for the add adventure page
class AddAdventuresViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dayField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var instructorIDField: UITextField!
    @IBOutlet weak var enrolledField: UITextField!
    @IBOutlet weak var capacityField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    // specifies what must load every time the page is accessed.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()


        
        // Do any additional setup after loading the view.
    }
    
    // checks for memory loss
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // allows a user to press a button
    // parameter sender: the ui button to be pressed.
    @IBAction func addButtonPresssed(sender: UIButton) {
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
