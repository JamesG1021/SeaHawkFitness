//
//  ShowTrainersViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray, Amanda H Harman, Weston E Joneson 4/20/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class ShowTrainersCell : UITableViewCell{
    

    @IBOutlet weak var instructorID: UILabel!
    @IBOutlet weak var instructorName: UILabel!
    
    func setupCell( instructorId: String!, name: String!){
        instructorID.text = instructorId
        instructorName.text = name

        let baseCell = UIImage(named: "BaseCell")!
        self.backgroundColor = UIColor(patternImage: baseCell.scaleUIImageToSize(baseCell, size: CGSizeMake(340, 62)))
        
        self.contentView.clipsToBounds = true;
    }
}


class ShowTrainersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    @IBOutlet weak var tableView: UITableView!
    
    let trainersAPI = "TrainersService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    var items = [Instructor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let nib = UINib(nibName:"ShowTrainersCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "ShowTrainersCell")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyData", object: nil)
        
        getTrainers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InstructorsItems.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ShowTrainersCell = (tableView.dequeueReusableCellWithIdentifier("ShowTrainersCell") as? ShowTrainersCell)!
        
        let trainer = InstructorsItems[indexPath.row]
        print(trainer.instructorID)
        cell.setupCell(String(trainer.instructorID), name: trainer.name)
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.cyanColor()
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! ShowTrainersCell
        tableView.beginUpdates()
        print(currentCell.instructorName.text)
        tableView.endUpdates()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func getTrainers(){
        
        makeDatabaseRequest(self.view, API: trainersAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
        
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
