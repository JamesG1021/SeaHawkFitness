//
//  ShowStudentsViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray on 4/18/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit
// Initializes the table view cells to be displayed on the view controller
class ShowStudentsCell : UITableViewCell{
    
    @IBOutlet weak var studentID: UILabel!
    @IBOutlet weak var studentName: UILabel!
    
    func setupCell( studentId: String!, name: String!){
        studentID.text = studentId
        studentName.text = name
 
        let baseCell = UIImage(named: "BaseCell")!
        self.backgroundColor = UIColor(patternImage: baseCell.scaleUIImageToSize(baseCell, size: CGSizeMake(340, 62)))
        
        self.contentView.clipsToBounds = true;
    }
}
// initializes the table view and specifies which API is to be used
class ShowStudentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    let studentsAPI = "StudentService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    var items = [Student]()
    
    // Specifies what must load on the page each and everytime it is accessed.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    // Sepcifies what must be loaded on the page anytime a user tries to access it via segue
    override func viewWillAppear(animated: Bool) {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let nib = UINib(nibName:"ShowStudentsCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "ShowStudentsCell")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyData", object: nil)
        
        StudentsItems.removeAll()
        getStudents()
    }
    // checks for memory loss
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // creates the table view
    // parameter table view: the ui table view to be used
    // parameter numberOfRowsInSection section: an int representing the number of rows to be displayed in the table view
    // returns studentsItems.count, the number of items that will ultimately be displayed
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentsItems.count
    }
    //part of creating the table view
    // parameter TableView: the uitableview that is being modified
    // parameter cellForRowAtIndexPath indexPath: the correlating index for which the API will pull information from
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ShowStudentsCell = (tableView.dequeueReusableCellWithIdentifier("ShowStudentsCell") as? ShowStudentsCell)!
        
        let student = StudentsItems[indexPath.row]
        
        cell.setupCell(String(student.studentID), name: student.name)
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.cyanColor()
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    // ***
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! ShowStudentsCell
        tableView.beginUpdates()
        print(currentCell.studentName.text)
        tableView.endUpdates()
    }
    // ***
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }

    // Makes the request to the mySQL database to populate the students table
    func getStudents(){
        
        makeDatabaseRequest(self.view, API: studentsAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
        
    }
    // refreshes the list uppon notification
    // parameters notification: refers to the button press of reload page for the show students table.
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
