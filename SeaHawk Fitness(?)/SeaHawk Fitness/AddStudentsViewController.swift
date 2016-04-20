//
//  AddStudentsViewController.swift
//  SeaHawk Fitness
//
//  Created by Amanda Harman on 4/18/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit


class AddStudentsViewController: UIViewController {
    
    let studentAPI = "StudentService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    var validInput : Bool = false
    
    func setupViews() {
        pageTitle.text = "Add New Student"
        studentIDLabel.text = "ID"
        nameLabel.text = "Name"
        
        messageLabel.text="Status message will go here"
        messageLabel.hidden = true
    }
    
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var studentIDLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var studentIDField: UITextField!
    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
    }
    
    @IBAction func addButtonPressed(sender: UIButton) {
        
        checkFormFilled()
    }
    
    func addStudent() {
        let editArgs = "insertion"
        RequestARGs = "name=" + nameField.text! + "&studentID=" + studentIDField.text!
        
        // Appwide addObject function ::
        //
        // REQUIRES: self.view, The API the ViewController uses, and the Constructed RequestARGs String
        // --------------------------------------------------------------------------------------------
        makeDatabaseRequest(self.view, API: studentAPI, EditARGs: editArgs, RequestARGs: RequestARGs)

    }
    
    func checkFormFilled() {
        messageLabel.hidden = true
        
        if studentIDField.text == ""
        {
            
            messageLabel.hidden = false
            messageLabel.text = "You must include a studentID to add a new student!"
            print("You must include a studentID to add a new student!")
        }
        
        if nameField.text == ""
        {
            messageLabel.hidden = false
            if messageLabel.text == ""
            {
                messageLabel.text = "You must include a student name to add a new student!"
            }
            print("You must include a student name to add a new student!")
        }
        
        if (studentIDField.text != "" && nameField.text != "")
        {
            validInput = true
        }
        
        if (validInput)
        {
            addStudent()
        }
    }


}
