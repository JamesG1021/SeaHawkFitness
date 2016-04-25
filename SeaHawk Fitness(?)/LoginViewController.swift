//
//  LoginViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray, Amanda H Harman, Weston E Jones on 4/1/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

//
class LoginViewController: UIViewController {
    
    let loginAPI = "LoginService"
    var RequestARGs = ""

    var isAdministrator : Bool = false
    var validInput : Bool = false
    
    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var UseAsGuest: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    
    
    @IBOutlet weak var AdministrativeSegmentedController: UISegmentedControl!
    
    @IBOutlet weak var ErrorMessageField: UILabel!
    // Determines what must load on the page whenever this view (login page) is loaded. contains the text fields to enter username and password as well as the hidden error message. 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        LoginTextField.placeholder = "Username"
        PasswordTextField.placeholder = "Student ID (950xxxxxx)"
        
        ErrorMessageField.hidden = true;
        ErrorMessageField.font = UIFont.systemFontOfSize(14.0)
        
        // Do any additional setup after loading the view.
    }
    // function for the button "Skip" on the login page to allow non-users to log into the app.
    @IBAction func UseAsGuest(sender: UIButton)
    {
            skipLogin()
    }
    // checks for memory errors
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Hides the error message for the login page and displays the appropriate error if either the username or password field is empty.
    @IBAction func LoginButton(sender: UIButton)
    {
        ErrorMessageField.hidden = true
        
        if LoginTextField.text == ""
        {
            
            ErrorMessageField.hidden = false
            ErrorMessageField.text = "You must enter a username to login!"
            print("You must enter a username to login!")
        }
        
        if PasswordTextField.text == ""
        {
            ErrorMessageField.hidden = false
            if ErrorMessageField.text == ""
            {
                ErrorMessageField.text = "You must enter a password to login!"
            }
            print("You must enter a password to login!")
        }
        
        if (LoginTextField.text != "" && PasswordTextField.text != "")
        {
            validInput = true
        }
        
        if (validInput)
        {
            if (isAdministrator) {
                adminLogin()
            } else {
                studentLogin()
            }
        }
        
        
    }
    // Determines whether the UISegmentedControl is either in the user or administrator positions.
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch AdministrativeSegmentedController.selectedSegmentIndex
        {
        case 0:
            isAdministrator = false
            print(isAdministrator)
        case 1:
            isAdministrator = true
            print(isAdministrator)
        default:
            break; 
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
    
    // Allows a user who is not in the database access the user side of the app, cannot perform any transactions though
    func skipLogin() {
        self.performSegueWithIdentifier("EnterMainMenuSegue", sender: nil)
    }
    
    // Checks to see if the username and password fields match up with those of the Admin table in the database and if true lets them proceed to the admin pages
    func adminLogin() {
        let username = LoginTextField.text
        let password = PasswordTextField.text
        
        RequestARGs = "username=" + username! + "&password=" + password! + "&admin=true"
        
        JSONService.sharedInstance.getJSON (loginAPI, ReqARGs: RequestARGs, onCompletion: { (json: JSON) in
            if let results = json.array {
                for entry in results {
                    if entry["success"].boolValue
                    {
                        dispatch_async(dispatch_get_main_queue(), {
                            self.performSegueWithIdentifier("IsAdmin", sender: nil)
                        })
                        print("Yup!!")
                    } else
                    {
                        print("Incorrect login")
                        dispatch_async(dispatch_get_main_queue(), {
                            self.ErrorMessageField.hidden = false
                            self.ErrorMessageField.text = entry["message"].stringValue
                        })
                    }
                }
            }
        })
    }
    
    // Checks to see if the username and password fields match up with those of the student table in the database and if so allows the user to access the user side of the app with "full" functionality.
    func studentLogin() {
        
        let username = LoginTextField.text
        let password = PasswordTextField.text
        
        RequestARGs = "username=" + username! + "&password=" + password!
        
        JSONService.sharedInstance.getJSON (loginAPI, ReqARGs: RequestARGs, onCompletion: { (json: JSON) in
            if let results = json.array{
                for entry in results {
                    if entry["success"].boolValue
                    {
                        dispatch_async(dispatch_get_main_queue(), {
                            self.performSegueWithIdentifier("EnterMainMenuSegue", sender: nil)
                        })
                        print("Yup!!")
                    } else
                    {
                        print("Incorrect login")
                        dispatch_async(dispatch_get_main_queue(), {
                            self.ErrorMessageField.hidden = false
                            self.ErrorMessageField.text = entry["message"].stringValue
                        })
                    }
                }
            }
        })
    }

}
