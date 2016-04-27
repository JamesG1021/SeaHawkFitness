//
//  MainMenuViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray on 4/1/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit
// initializes the view controller for the landing page after logging in
class MainMenuViewController: UIViewController {
    
    var FirstEnter = true

    // specifies what must load whenever this page is opened.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    // makes sure that there are no loses in memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("HEY HEY HEY!!!")
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
