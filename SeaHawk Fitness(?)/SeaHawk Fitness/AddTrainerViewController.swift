//
//  AddTrainerViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray on 4/19/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class AddTrainerViewController: UIViewController {

    @IBOutlet weak var TrainerID: UITextField!
    @IBOutlet weak var TrainerName: UITextField!

    
    @IBOutlet weak var messageLabel: UILabel!
    
    let trainerAPI = "TrainersService"
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
    func addTrainer() {
        EditARGs = "insertion"
        RequestARGs = "name=" + TrainerName.text! + "&instructorID=" + TrainerID.text!
        
        // Appwide addObject function ::
        //
        // REQUIRES: self.view, The API the ViewController uses, and the Constructed RequestARGs String
        // --------------------------------------------------------------------------------------------
        makeDatabaseRequest(self.view, API: trainerAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
    }
    
    func checkFormFilled() {
        messageLabel.hidden = true
        
        if TrainerID.text == ""
        {
            
            messageLabel.hidden = false
            messageLabel.text = "You must include a Trainer ID to add a new trainer!"
            print("You must include a  Trainer ID to add a new trainer!")
        }
        
        if TrainerName.text == ""
        {
            messageLabel.hidden = false
            if messageLabel.text == ""
            {
                messageLabel.text = "You must include a trainer name to add a new trainer!"
            }
            print("You must include a trainer name to add a new trainer!")
        }
        
        if (TrainerID.text != "" && TrainerName.text != "")
        {
            validInput = true
        }
        
        if (validInput)
        {
            addTrainer()
        }
    }
}
