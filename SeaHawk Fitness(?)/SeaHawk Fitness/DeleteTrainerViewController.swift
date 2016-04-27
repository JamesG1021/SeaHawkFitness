//
//  DeleteTrainerViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray on 4/20/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

// Initializes the view controller and and specifies which API to use
class DeleteTrainerViewController: UIViewController {
    
    let trainersAPI = "TrainersService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    var validInput: Bool = false

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var trainerIDField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    // Specifies what must be included on the page every time it is accessed.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    // checks to see if there were any memory issues
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Makes sure the form was filled out properly and completely on button press
    // parameter sender: the button that commits the deletion to the database
    @IBAction func submitButtonPressed(sender: UIButton) {
        checkFormFilled()
    }
    
    // makes the call to the database to delete a trainer
    func deleteTrainer() {
        
        EditARGs = "deletion"
        RequestARGs = "name=" + nameField.text! + "&instructorID=" + trainerIDField.text!
        
        // Appwide addObject function ::
        //
        // REQUIRES: self.view, The API the ViewController uses, and the Constructed RequestARGs String
        // --------------------------------------------------------------------------------------------
        makeDatabaseRequest(self.view, API: trainersAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
        
    }
    // makes sure that the forms have been properly filled out.
    func checkFormFilled() {
        messageLabel.hidden = true
        
        if trainerIDField.text == ""
        {
            
            messageLabel.hidden = false
            messageLabel.text = "You must include a trainer ID to add a new trainer!"
            print("You must include a trainer ID to add a new trainer!")
        }
        
        if trainerIDField.text == ""
        {
            messageLabel.hidden = false
            if messageLabel.text == ""
            {
                messageLabel.text = "You must include a trainer name to add a new trainer!"
            }
            print("You must include a trainer name to add a new trainer!")
        }
        
        if (trainerIDField.text != "" && trainerIDField.text != "")
        {
            validInput = true
        }
        
        if (validInput)
        {
            deleteTrainer()
        }
    }
    

 

    
    
}
