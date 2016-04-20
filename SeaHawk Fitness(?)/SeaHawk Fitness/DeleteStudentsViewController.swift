//
//  DeleteStudentsViewController.swift
//  SeaHawk Fitness
//
//  Created by Amanda Harman on 4/18/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class DeleteStudentsCell : UITableViewCell{
    
    @IBOutlet weak var studentID: UILabel!
    @IBOutlet weak var studentName: UILabel!
    
    func setupCell( studentId: String!, name: String!){
        studentID.text = studentId
        studentName.text = name
 
        //self.contentView.clipsToBounds = true;
    }
}

class DeleteStudentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    let studentsAPI = "StudentService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let nib = UINib(nibName:"DeleteStudentsCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "DeleteStudentsCell")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyData", object: nil)
        
        getStudents()

    }
    
    func refreshList(notification: NSNotification){
        self.tableView.reloadData()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentsItems.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: DeleteStudentsCell = (tableView.dequeueReusableCellWithIdentifier("DeleteStudentsCell") as? DeleteStudentsCell)!
        
        let student = StudentsItems[indexPath.row]
        
        cell.setupCell(String(student.studentID), name: student.name)
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! DeleteStudentsCell
        
        //tableView.beginUpdates()
        
        deleteStudent(currentCell.studentID.text!)
        
        //tableView.endUpdates()
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
    
    func updateStudents(){
        StudentsItems.removeAll()
        EditARGs = ""
        RequestARGs = ""
        getStudents()
    }
    
    func deleteStudent(studentID : String){
        EditARGs = "deletion"
        RequestARGs = "studentID=" + studentID
        
        makeDatabaseRequest(self.view, API: studentsAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
        updateStudents()
    }

}
