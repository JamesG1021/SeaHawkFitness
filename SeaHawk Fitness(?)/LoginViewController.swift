//
//  LoginViewController.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/1/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
    let groupScheduleAPI = "LoginService"
    var isAdministrator : Bool = false

    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var UseAsGuest: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var AdministrativeSegmentedController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LoginTextField.placeholder = "Username"
        PasswordTextField.placeholder = "Student ID (850xxxxxx)"
        
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
        if (isAdministrator) {
            adminLogin()
        } else {
            studentLogin()
        }
        
    }

    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch AdministrativeSegmentedController.selectedSegmentIndex
        {
        case 0:
            isAdministrator = false
        case 1:
            isAdministrator = true
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
    
    
    func skipLogin() {

    }
    
    func adminLogin() {
        
    }
    
    func studentLogin() {
        
    }

}
