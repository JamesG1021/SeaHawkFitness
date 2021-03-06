//
//  GroupExerciseViewController.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones, James Stinson Gray  on 3/31/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit
// Initializes the Group Exercise View Controller with the correct API as well as the table view, text fields, and buttons
class GroupExerciseViewController: UIViewController, UITableViewDataSource,
UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var txt: UITextField!
    
    @IBOutlet weak var UpdateCalenderButton: UIButton!
    
    let groupScheduleAPI = "GroupExerciseService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!

    func refreshList(notification: NSNotification){
        
        self.tableView.reloadData()
    }
    // Determines what must load on the group exercise page whenever it is accessed.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyData", object: nil)
        
        let contentArea = UIImage(named: "ContentArea")!
        view.backgroundColor = UIColor(patternImage: contentArea.scaleUIImageToSize(contentArea, size: CGSizeMake(screenWidth, screenHeight)))
        
        /*
        let tapSelector : Selector = #selector(self.selectCalenderItem(_:))
        let dblTapSelector : Selector = #selector(self.showDescription)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: tapSelector)
        let doubleTapGesture = (UITapGestureRecognizer(target: self, action: dblTapSelector))
        
        tapGesture.numberOfTapsRequired = 1
        tapGesture.cancelsTouchesInView = true;
        // tapGesture.delaysTouchesBegan = true;
        
        doubleTapGesture.numberOfTapsRequired = 2
        tapGesture.requireGestureRecognizerToFail(doubleTapGesture)
        
        self.tableView.addGestureRecognizer(tapGesture)
        self.tableView.addGestureRecognizer(doubleTapGesture)
        */
        
        // Do any additional setup after loading the view.
    }
    // specifies what the page must load whenever a user segues into this page
    override func viewWillAppear(animated: Bool) {

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let classNib = UINib(nibName: "ExerciseClassCell", bundle: nil)
        let descNib = UINib(nibName: "ClassDescriptionCell", bundle: nil)
        
        tableView.registerNib(descNib, forCellReuseIdentifier: "CalenderDescriptionCell")
        tableView.registerNib(classNib, forCellReuseIdentifier: "CalenderItemCell")
        
        tableView.layer.cornerRadius = 10
        tableView.layer.masksToBounds = true
        
        txt.placeholder = "What day would you like to see?"
        txt.delegate = self
        
        UpdateCalenderButton.setTitle("Update Calender", forState: UIControlState.Normal)
        
        if ExerciseClassItems.count == 0 {
            getCalender()
        }
        

    }
    // Updates the calender whenever the button is pressed.
    //parameter sender: links to the UIButton that refreshes the calender.
    @IBAction func UpdateCalender(sender: UIButton) {
        updateCalender()
    }
    
    // creates the Table view for the page
    // parameters UITableView: loads the Table view
    // parameters numberOfRowsInSection section: an int telling how many items need to be displayed on the page
    // returns the count of items in the list of Group Exercise.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExerciseClassItems.count
    }
    
    //*** Class function for setting up rows in a tableview REQUIRED
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ExerciseClassCell = (tableView.dequeueReusableCellWithIdentifier("CalenderItemCell") as? ExerciseClassCell)!
        
        let exerciseClass = ExerciseClassItems[indexPath.row]

        cell.setupCell(exerciseClass.courseName,
                       timeFrame: exerciseClass.timeFrame,
                       location: exerciseClass.studio,
                       description: exerciseClass.description)
        
        let selectedCell = UIView()
        let selectColor = UIImage(named: "SelectedCell")!
        selectedCell.backgroundColor = UIColor(patternImage: selectColor.scaleUIImageToSize(selectColor, size: CGSizeMake(390, 62)))
        cell.selectedBackgroundView = selectedCell
        
        return cell
    }
    //*** Class function for tableviews.  Determines what row has been selected in tableview REQUIRED
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! ExerciseClassCell
        //tableView.beginUpdates()
        //currentCell.ExerciseClassDescription.hidden = false
        print(currentCell.ExerciseClassName.text)
        //tableView.endUpdates()
    }
    //*** Class function for tableviews.  Setups up default height for a tableview cell.
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    // Makes the request to the API to get the calender containing the group Schedule
    func getCalender() {
        makeDatabaseRequest(self.view, API: groupScheduleAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
    }
    
    // Updates the calender based on what day the user enters into the text field.
    func updateCalender() {
        let day = txt?.text
        RequestARGs = "day=" + day!
        getCalender()
    }
    //***  Class function of UITextField Delegate  tells keyboard to dismiss on enter
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    //***
    @IBAction func PresentInfoView(sender: AnyObject) {
    }
    
    
    /*
    func selectCalenderItem(recognizer : UIGestureRecognizer) {
        print("add cell to calender")
        if recognizer.state == UIGestureRecognizerState.Ended {
            let tapLocation = recognizer.locationInView(self.tableView)
            if let tappedIndexPath = tableView.indexPathForRowAtPoint(tapLocation) {
                if let tappedCell = self.tableView.cellForRowAtIndexPath(tappedIndexPath) {
                    
                    // If the cell is already selected De-Select it.  Otherwise, select it.
                    if tappedCell.selected == true{
                        tappedCell.selected = false
                    } else
                    {
                        tappedCell.selected = true
                    }
                    
                }
            }
        }
        
    }
    */
    // Displays the description of the course you are looking at.
    func showDescription()
    {
        print("show cell description")
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
