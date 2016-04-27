//
//  AddStudentsViewController.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones, Architecture by James Stinson Gray on 4/19/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit
// initializes the view controller for the add students page
class AddStudentsViewController: UIViewController {
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var studentIDLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var studentIDField: UITextField!
    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!

    let studentsAPI = "StudentService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    var validInput: Bool = false
    
    // specifies what must load whenever the page is accessed
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        pageTitle.text = "Add New Student"
        studentIDLabel.text = "ID"
        nameLabel.text = "Name"
        
        messageLabel.text="Status message will go here"


        // Do any additional setup after loading the view.
    }
    // checks for memory loss
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // checks to see if the button was pressed for submission
    //parameter sender: the uibutton that will submit the commit
    @IBAction func addButtonPressed(sender: UIButton) {
        
        checkFormFilled()
    }
    
    // the call to the database to insert students into the database
    func addStudent() {
        EditARGs = "insertion"
        RequestARGs = "name=" + nameField.text! + "&studentID=" + studentIDField.text!
        
        // Appwide addObject function ::
        //
        // REQUIRES: self.view, The API the ViewController uses, and the Constructed RequestARGs String
        // --------------------------------------------------------------------------------------------
        makeDatabaseRequest(self.view, API: studentsAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
        
    }
    // makes sure that the page was filled out completely and correctly.
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
