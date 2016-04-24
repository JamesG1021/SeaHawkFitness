//
//  DeleteStudentsViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray, Amanda H Harman, Weston E Jones on 4/20/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class DeleteStudentsViewController: UIViewController {
    
    let studentsAPI = "StudentService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    var validInput: Bool = false
    
    @IBOutlet var studentIDField: UITextField!
    @IBOutlet var studentNameField: UITextField!
    @IBOutlet var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.loadView()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitButtonPressed(sender: AnyObject)
    {
        checkFormFilled()
    }
    
    func deleteStudent() {
        
        EditARGs = "deletion"
        RequestARGs = "name=" + studentNameField.text! + "&studentID=" + studentIDField.text!
        
        // Appwide addObject function ::
        //
        // REQUIRES: self.view, The API the ViewController uses, and the Constructed RequestARGs String
        // --------------------------------------------------------------------------------------------
        makeDatabaseRequest(self.view, API: studentsAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
        
    }
    
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

    
    @IBAction func cancelButtonPressed(sender: AnyObject)
    {
        
    }
    
}