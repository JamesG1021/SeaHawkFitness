//
//  GroupExerciseViewController.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 3/31/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class ExerciseClassCell : UITableViewCell
{
    
    @IBOutlet weak var ExerciseClassName: UILabel!
    @IBOutlet weak var ExerciseClassTimeframe: UILabel!
    @IBOutlet weak var ExerciseClassLocation: UILabel!
    
    func setupCell(name: String!, startTime: String!, location: Int!)
    {
        // Add end time to create a time range.
        
        ExerciseClassName.text = name
        ExerciseClassName.font = UIFont.boldSystemFontOfSize(18)
        
        ExerciseClassLocation.text = String(location)
        ExerciseClassLocation.textColor = UIColor.grayColor()
        ExerciseClassLocation.font = UIFont.systemFontOfSize(15)
        
        ExerciseClassTimeframe.text = startTime
        ExerciseClassTimeframe.textColor = UIColor.grayColor()
        ExerciseClassTimeframe.font = UIFont.systemFontOfSize(15)
        
        
        
    }
}

class ClassDescriptionCell : UITableViewCell
{
    @IBOutlet weak var ExerciseClassDescription: UITextView!
}


class GroupExerciseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var txt: UITextField!
    
    @IBOutlet weak var UpdateCalenderButton: UIButton!
    
    let groupScheduleAPI = "GroupExerciseService"
    var RequestARGs = ""
    
    var items = [GroupExerciseClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let nib = UINib(nibName: "ExerciseClassCell", bundle: nil)
        
        tableView.registerNib(nib, forCellReuseIdentifier: "CalenderItemCell")

        txt.placeholder = "What day would you like to see?"
        
        UpdateCalenderButton.setTitle("Update Calender", forState: UIControlState.Normal)
        
        getCalender()

    }
    
    @IBAction func UpdateCalender(sender: UIButton) {
        updateCalender()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ExerciseClassCell = (tableView.dequeueReusableCellWithIdentifier("CalenderItemCell") as? ExerciseClassCell)!
        
        let exerciseClass = self.items[indexPath.row]
        
        cell.setupCell(exerciseClass.courseName, startTime: exerciseClass.time, location: exerciseClass.courseID)
        return cell
    }
    
    func getCalender() {
        JSONService.sharedInstance.getJSON (groupScheduleAPI, ReqARGs: RequestARGs, onCompletion: { (json: JSON) in
            if let results = json.array {
                for entry in results {
                    self.items.append(GroupExerciseClass(json: entry))
                    print(entry)
                }
                dispatch_async(dispatch_get_main_queue(),{
                    self.tableView!.reloadData()
                })
            }
        })
    }
    
    func updateCalender() {
        let day = txt?.text
        RequestARGs = "day=" + day!
        self.items.removeAll()
        getCalender()
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
