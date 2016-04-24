//
//  AddEquipmentViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray, Amanda H Harman, Weston E Jones on 4/20/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class AddEquipmentViewController: UIViewController {

    @IBOutlet weak var equipmentIDField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    let equipmentAPI = "RentalService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    var validInput: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButtonPressed(sender: UIButton) {
        checkFormFilled()
    }
    func addEquipment() {
        EditARGs = "insertion"
        RequestARGs = "equipName=" + nameField.text! + "&equipID=" + equipmentIDField.text! + "&equipPrice=" + priceField!.text!
        
        // Appwide addObject function ::
        //
        // REQUIRES: self.view, The API the ViewController uses, and the Constructed RequestARGs String
        // --------------------------------------------------------------------------------------------
        makeDatabaseRequest(self.view, API: equipmentAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
        
    }
    
    
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
