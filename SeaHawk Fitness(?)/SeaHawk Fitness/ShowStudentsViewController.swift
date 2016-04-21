//
//  ShowStudentsViewController.swift
//  SeaHawk Fitness
//
//  Created by Amanda Harman on 4/18/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class ShowStudentsCell : UITableViewCell{
    
    @IBOutlet weak var studentID: UILabel!
    @IBOutlet weak var studentName: UILabel!
    
    func setupCell( studentId: String!, name: String!){
        studentID.text = studentId
        studentName.text = name
 
        self.contentView.clipsToBounds = true;
    }
}

class ShowStudentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    let studentsAPI = "StudentService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    var items = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let nib = UINib(nibName:"ShowStudentsCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "ShowStudentsCell")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyData", object: nil)
        
        StudentsItems.removeAll()
        getStudents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentsItems.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ShowStudentsCell = (tableView.dequeueReusableCellWithIdentifier("ShowStudentsCell") as? ShowStudentsCell)!
        
        let student = StudentsItems[indexPath.row]
        
        cell.setupCell(String(student.studentID), name: student.name)
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.cyanColor()
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! ShowStudentsCell
        tableView.beginUpdates()
        print(currentCell.studentName.text)
        tableView.endUpdates()
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func getStudents(){
        
        makeDatabaseRequest(self.view, API: studentsAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
        
    }

    func refreshList(notification: NSNotification){
        
        self.tableView.reloadData()
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
