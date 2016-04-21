//
//  DeleteTrainerViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray on 4/20/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class DeleteTrainerViewController: UIViewController {
    
    let trainersAPI = "TrainersService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    var validInput: Bool = false

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var trainerIDField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
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
    
    func deleteTrainer() {
        
        EditARGs = "deletion"
        RequestARGs = "name=" + nameField.text! + "&instructorID=" + trainerIDField.text!
        
        // Appwide addObject function ::
        //
        // REQUIRES: self.view, The API the ViewController uses, and the Constructed RequestARGs String
        // --------------------------------------------------------------------------------------------
        makeDatabaseRequest(self.view, API: trainersAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
        
    }
    
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
