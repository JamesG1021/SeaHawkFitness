//
//  AddTrainerViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray on 4/19/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class AddTrainerViewController: UIViewController {

    @IBOutlet weak var TrainerID: UITextField!
    @IBOutlet weak var TrainerName: NSLayoutConstraint!
    
    let trainerAPI = "TrainersService"
    var RequestARGs = ""
    
    var items = [Instructor]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTrainer() {
        
        JSONService.sharedInstance.getJSON (trainerAPI, ReqARGs: RequestARGs, onCompletion: { (json: JSON) in
            if let results = json.array {
                for entry in results {
                    self.items.append(Instructor(json: entry))
                    print(entry)
                }
                dispatch_async(dispatch_get_main_queue(),{
                })
            }
        })
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
