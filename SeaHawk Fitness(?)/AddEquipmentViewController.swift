//
//  AddEquipmentViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray, Amanda H Harman, Weston E Jones on 4/20/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit
// initializes the view controller for the addition of equipment to the rentals page.
class AddEquipmentViewController: UIViewController {

    @IBOutlet weak var equipmentIDField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    let equipmentAPI = "RentalService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    var validInput: Bool = false
    // what must be loaded each time the page is accessed
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
    }
    // checks for any memory loss
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // submits the commit when the button is pressed
    // parameter sender: the uibutton linked to the command
    @IBAction func submitButtonPressed(sender: UIButton) {
        checkFormFilled()
    }
    
    // Makes the request to the database to add equipment to the rentals page
    func addEquipment() {
        EditARGs = "insertion"
        RequestARGs = "equipName=" + nameField.text! + "&equipID=" + equipmentIDField.text! + "&equipPrice=" + priceField!.text!
        
        // Appwide addObject function ::
        //
        // REQUIRES: self.view, The API the ViewController uses, and the Constructed RequestARGs String
        // --------------------------------------------------------------------------------------------
        makeDatabaseRequest(self.view, API: equipmentAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
        
    }
    
    // makes sure that all the needed values have been entered correctly to avoid nulls
    func checkFormFilled() {
        messageLabel.hidden = true
        
        if equipmentIDField.text == ""
        {
            
            messageLabel.hidden = false
            messageLabel.text = "You must include a equipment ID to add a new equipment!"
            print("You must include a equipment ID to add a new equipment!")
        }
        
        if nameField.text == ""
        {
            messageLabel.hidden = false
            if messageLabel.text == ""
            {
                messageLabel.text = "You must include an equipment name to add a new equipment!"
            }
            print("You must include an equipment name to add a new equipment!")
        }
        if priceField.text == ""
        {
            messageLabel.hidden = false
            if messageLabel.text == ""
            {
                messageLabel.text = "You must include an equipment price to add a new equipment!"
            }
            print("You must include an equipment price to add a new equipment!")
        }
        
        if (equipmentIDField.text != "" && nameField.text != "" && priceField != "")
        {
            validInput = true
        }
        
        if (validInput)
        {
            addEquipment()
        }
    }




}
