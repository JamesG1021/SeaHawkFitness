//
//  ShowAdventuresViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray, Amanda H Harman, Weston E Jones on 4/18/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit
// initializes the table view cells that are to be displayed on the table view controller
class ShowAdventuresCell: UITableViewCell{
    
    @IBOutlet weak var adventureName: UILabel!
    
    func setupCell(name: String!){
        adventureName.text = name
        
        let baseCell = UIImage(named: "BaseCell")!
        self.backgroundColor = UIColor(patternImage: baseCell.scaleUIImageToSize(baseCell, size: CGSizeMake(340, 110)))
        
        self.contentView.clipsToBounds = true;
    }
}
// initializes the table view controller and specifies which API it will be using
class ShowAdventuresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!

    let adventuresAPI = "AdventuresService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    
    func refreshList(notification: NSNotification){
        
        self.tableView.reloadData()
    }
    // Specifies what must load on the page each and everytime it is accessed.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyData", object: nil)

        // Do any additional setup after loading the view.
    }
    // activated whenever the user traverses a segue to the page
    override func viewWillAppear(animated: Bool) {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let nib = UINib(nibName:"ShowAdventuresCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "ShowAdventuresCell")
        
        if AdventuresItems.count == 0 {
            getAdventures()
        }
        
        
    }
    // makes sure that there were no issues within memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // creates the tableview 
    // parameters tableView: the UI table view to be used
    // parameters numberOfRowsInSection section: an int representing the number of rows.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AdventuresItems.count
    }
    // creates the tableview
    // parameters tableView: the UI table view to be used
    // parameters cellForRowAtIndexPath indexPath: where to find the data in the list
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ShowAdventuresCell = (tableView.dequeueReusableCellWithIdentifier("ShowAdventuresCell") as? ShowAdventuresCell)!
        
        let adventure = AdventuresItems[indexPath.row]
        
        cell.setupCell(adventure.name)
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.cyanColor()
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    // creates the tableview
    // parameters tableView: the UI table view to be used
    // parameters didSelectRowAtIndexPath indexPath: where to find the data in the list
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! ShowAdventuresCell
        tableView.beginUpdates()
        print(currentCell.adventureName.text)
        tableView.endUpdates()
    }
    // determines the height for each row
    // parameter tableView: the ui table view
    // parameter heightForRowAtIndexPath indexPath: the place where you are determining the height.
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
    
    // makes request to the database to populate the table view.
    func getAdventures(){
        makeDatabaseRequest(self.view, API: adventuresAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
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
