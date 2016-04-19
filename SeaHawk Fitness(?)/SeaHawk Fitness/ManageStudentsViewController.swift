//
//  ManageStudentsViewController.swift
//  SeaHawk Fitness
//
//  Created by Amanda Harman on 4/18/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class ManageStudentsViewController: UIViewController {
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var studentIDLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var studentIDField: UITextField!
    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageTitle.text = "Add New Student"
        studentIDLabel.text = "ID"
        nameLabel.text = "Name"
        
        messageLabel.text="Status message will go here"


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonPressed(sender: UIButton) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
