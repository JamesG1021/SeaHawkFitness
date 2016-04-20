//
//  AddAdventuresViewController.swift
//  SeaHawk Fitness
//
//  Created by Amanda Harman on 4/18/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class AddAdventuresViewController: UIViewController {

    @IBOutlet var AdventureIDField: UITextField!
    @IBOutlet var NameField: UITextField!
    @IBOutlet var StartDateField: UITextField!
    @IBOutlet var EndDateField: UITextField!
    @IBOutlet var TimeField: UITextField!
    @IBOutlet var PriceField: UITextField!
    @IBOutlet var DescriptionField: UITextView!
    @IBOutlet var InstructorIDField: UITextField!
    @IBOutlet var EnrolledField: UITextField!
    @IBOutlet var CapacityField: UITextField!
    
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    let studentAPI = "AdventuresService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    var validInput : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.text = ""
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyData", object: nil)
    }

    @IBAction func addButtonPresssed(sender: UIButton) {
       checkFormFilled()
    }

    func checkFormFilled()
    {
        messageLabel.hidden = true
        
        if AdventureIDField.text == ""
        {
            messageLabel.hidden = false
            messageLabel.text = messageLabel.text! + "You must include a Adventure ID to add a new Adventure"
            print("You must include a Adventure ID to add a new Adventure!")
        }
        if NameField.text == ""
        {
            messageLabel.hidden = false
            messageLabel.text = messageLabel.text! + "You must include a Adventure Name to add a new Adventure"
            print("You must include a Adventure Name to add a new Adventure!")
        }
        if StartDateField.text == ""
        {
            messageLabel.hidden = false
            if messageLabel.text == ""
            {
                messageLabel.text = messageLabel.text! + "You must include a Start Date to add a new Adventure"
            }
            print("You must include a Start Date to add a new Adventure!")
        }
        if EndDateField.text == ""
        {
            messageLabel.hidden = false
            if messageLabel.text == ""
            {
                messageLabel.text = messageLabel.text! + "You must include a End Date to add a new Adventure"
            }
            print("You must include a End Date to add a new Adventure!")
        }
        if TimeField.text == ""
        {
            messageLabel.hidden = false
            if messageLabel.text == ""
            {
                messageLabel.text = messageLabel.text! + "You must include a Time to add a new Adventure"
            }
            print("You must include a Time to add a new Adventure!")
        }
        if PriceField.text == ""
        {
            messageLabel.hidden = false
            if messageLabel.text == ""
            {
                messageLabel.text = messageLabel.text! + "You must include a Price to add a new Adventure"
            }
            print("You must include a Price to add a new Adventure!")
        }
        if DescriptionField.text == ""
        {
            messageLabel.hidden = false
            if messageLabel.text == ""
            {
                messageLabel.text = messageLabel.text! + "You must include a Description to add a new Adventure"
            }
            print("You must include Description to add a new Adventure!")
        }
        if InstructorIDField.text == ""
        {
            messageLabel.hidden = false
            if messageLabel.text == ""
            {
                messageLabel.text = messageLabel.text! + "You must include a Instructor ID to add a new Adventure"
            }
            print("You must include a Instructor ID to add a new Adventure!")
        }
        if EnrolledField.text == ""
        {
            messageLabel.hidden = false
            if messageLabel.text == ""
            {
                messageLabel.text = messageLabel.text! + "You must include a enrollment value to add a new Adventure"
            }
            print("You must include a enrollment value to add a new Adventure!")
        }
        if CapacityField.text == ""
        {
            messageLabel.hidden = false
            if messageLabel.text == ""
            {
                messageLabel.text = messageLabel.text! + "You must include a capacity value to add a new Adventure"
            }
            print("You must include a capacity value to add a new Adventure!")
        }
        
        if (AdventureIDField.text != "" && NameField.text != "" && StartDateField.text != "" && EndDateField.text != "" &&
            TimeField.text != "" && PriceField.text != "" && DescriptionField.text != "" && InstructorIDField.text != "" &&
                EnrolledField.text != "" && CapacityField.text != "")
        {
            validInput = true
        }
        if (validInput)
        {
            addAdventure()
        }
    }
    
    func addAdventure() {
        EditARGs = "insertion"
        RequestARGs = "adventureID=" + AdventureIDField.text! + "&name=" + NameField.text! +
                      "&startDate=" + StartDateField.text! + "&endDate=" + EndDateField.text! +
                      "&description=" + DescriptionField.text! + "&instructorID=" + InstructorIDField.text! +
                      "&enrolled=" + EnrolledField.text! + "&capacity=" + CapacityField.text! +
                      "&price=" + PriceField.text!
        
        // Appwide addObject function ::
        //
        // REQUIRES: self.view, The API the ViewController uses, and the Constructed RequestARGs String
        // --------------------------------------------------------------------------------------------
        makeDatabaseRequest(self.view, API: studentAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
        

    }
}
