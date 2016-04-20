//
//  LoginViewController.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/1/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit


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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LoginTextField.placeholder = "Username"
        PasswordTextField.placeholder = "Student ID (950xxxxxx)"
        
        ErrorMessageField.hidden = true;
        ErrorMessageField.font = UIFont.systemFontOfSize(14.0)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func UseAsGuest(sender: UIButton)
    {
            skipLogin()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginButton(sender: UIButton)
    {
        checkValidLogin()
    }

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

    
    func skipLogin() {
        self.performSegueWithIdentifier("EnterMainMenuSegue", sender: nil)
    }
    
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
    
    func checkValidLogin() {
        
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

}
