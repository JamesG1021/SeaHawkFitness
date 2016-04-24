//
//  GroupExerciseViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray, Amanda H Harman, Weston E Jones on 3/31/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class GroupExerciseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var txt: UITextField!
    
    @IBOutlet weak var UpdateCalenderButton: UIButton!
    
    let groupScheduleAPI = "GroupExerciseService"
    var RequestARGs = ""
    
    var items = [GroupExerciseClass]()
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
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
        
        UpdateCalenderButton.setTitle("Update Calender", forState: UIControlState.Normal)
        
        getCalender()

    }
    
    @IBAction func UpdateCalender(sender: UIButton) {
        updateCalender()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ExerciseClassCell = (tableView.dequeueReusableCellWithIdentifier("CalenderItemCell") as? ExerciseClassCell)!
        
        let exerciseClass = self.items[indexPath.row]

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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! ExerciseClassCell
        tableView.beginUpdates()
        //currentCell.ExerciseClassDescription.hidden = false
        print(currentCell.ExerciseClassName.text)
        tableView.endUpdates()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
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
