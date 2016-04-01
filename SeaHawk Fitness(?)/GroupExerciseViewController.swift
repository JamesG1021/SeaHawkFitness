//
//  GroupExerciseViewController.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 3/31/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class GroupExerciseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let dataService = JSONService()
    let groupScheduleURL = "GroupExerciseService"
    var RequestARGs = ""
    
    var tableView:UITableView?
    var txt:UITextField?
    var items = [GroupExerciseClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        //dataService.getJSON(groupScheduleURL, ReqARGs: "day=Monday", onCompletion: <#T##(JSON) -> Void#>)
        let frame: CGRect = CGRect(x: 0, y: 100, width: self.view.frame.width,
                                   height:self.view.frame.height - 200)
        
        self.tableView = UITableView(frame: frame)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.view.addSubview(self.tableView!)
        
        let btn = UIButton(frame: CGRect(x: 0,y: 25, width: self.view.frame.width, height: 50))
        btn.backgroundColor = UIColor.cyanColor()
        btn.setTitle("Get Calender", forState: UIControlState.Normal)
        
        btn.addTarget(self, action: #selector(GroupExerciseViewController.getCalender), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn)
        
        txt = UITextField(frame: CGRect(x: 0, y:635, width: self.view.frame.width, height: 30))
        txt!.placeholder = "What day would you like to see?"
        
        self.view.addSubview(txt!)
        
        let btn2 = UIButton(frame: CGRect(x: 0, y:685, width: self.view.frame.width, height: 50))
        btn2.backgroundColor = UIColor.cyanColor()
        btn2.setTitle("Update Calender", forState: UIControlState.Normal)
        
        btn2.addTarget(self, action: #selector(GroupExerciseViewController.updateCalender), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(btn2)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL")
        
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "CELL")
        }
        
        let exerciseClass = self.items[indexPath.row]
        
        cell!.textLabel?.text = exerciseClass.courseName
        return cell!
    }
    
    func getCalender() {
        JSONService.sharedInstance.getJSON (groupScheduleURL, ReqARGs: RequestARGs, onCompletion: { (json: JSON) in
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
