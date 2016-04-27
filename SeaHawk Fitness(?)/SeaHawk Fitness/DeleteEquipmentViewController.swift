//
//  DeleteEquipmentViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray on 4/20/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit
// initializs the view controller and designates which API it should use.
class DeleteEquipmentViewController: UIViewController {

    @IBOutlet weak var equipmentIDField: UITextField!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    let equipmentAPI = "RentalService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    var validInput: Bool = false
    
    // Specifies what must be loaded every time this page is accessed.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    // checks to see if there was a memory issue
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // makes sure the form has been filled out correctly on button press
    // parameter sender: the button that is pressed to commit the deletion
    @IBAction func submitButtonPressed(sender: UIButton) {
        checkFormFilled()
    }
    // Makes the call to the database to delete equipment
    func deleteEquipment() {
        
        EditARGs = "deletion"
        RequestARGs = "equipName=" + equipmentIDField.text! + "&equipID=" + equipmentIDField.text! + "&equipPrice" + priceField.text!
        
        // Appwide addObject function ::
        //
        // REQUIRES: self.view, The API the ViewController uses, and the Constructed RequestARGs String
        // --------------------------------------------------------------------------------------------
        makeDatabaseRequest(self.view, API: equipmentAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
        
    }
    // makes sure that the form has been completely and properly filled out.
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
            deleteEquipment()
        }
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
