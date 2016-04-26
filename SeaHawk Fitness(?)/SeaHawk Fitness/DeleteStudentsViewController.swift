//
//  DeleteStudentsViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray, Amanda H Harman, Weston E Jones on 4/20/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

// Initializes the view controller and designates which API it will use.
class DeleteStudentsViewController: UIViewController {
    
    let studentsAPI = "StudentService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    var validInput: Bool = false
    
    @IBOutlet var studentIDField: UITextField!
    @IBOutlet var studentNameField: UITextField!
    @IBOutlet var messageLabel: UILabel!
    
    // Specifies what must load whenever the page is accessed.
    override func viewDidLoad() {
        super.loadView()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    // Just checks for memory warnings and errors
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Checks to make sure that the form was filled on button press
    // Parameter sender: the button that is pressed to submit the deletion
    @IBAction func submitButtonPressed(sender: AnyObject)
    {
        checkFormFilled()
    }
    
    // makes the request to the database to delete a student entity
    func deleteStudent() {
        
        EditARGs = "deletion"
        RequestARGs = "name=" + studentNameField.text! + "&studentID=" + studentIDField.text!
        
        // Appwide addObject function ::
        //
        // REQUIRES: self.view, The API the ViewController uses, and the Constructed RequestARGs String
        // --------------------------------------------------------------------------------------------
        makeDatabaseRequest(self.view, API: studentsAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
        
    }
    
    // Makes sure the form is filled out fully and correctly
    func checkFormFilled() {
        messageLabel.hidden = true
        
        if studentIDField.text == ""
        {
            
            messageLabel.hidden = false
            messageLabel.text = "You must include a studentID to add a new student!"
            print("You must include a studentID to add a new student!")
        }
        
        if studentNameField.text == ""
        {
            messageLabel.hidden = false
            if messageLabel.text == ""
            {
                messageLabel.text = "You must include a student name to add a new student!"
            }
            print("You must include a student name to add a new student!")
        }
        
        if (studentIDField.text != "" && studentNameField.text != "")
        {
            validInput = true
        }
        
        if (validInput)
        {
           deleteStudent()
        }
    }

    // the cancel button which was supposed to send the request to the database to perform a rollback.
    @IBAction func cancelButtonPressed(sender: AnyObject)
    {
        
    }
    
}