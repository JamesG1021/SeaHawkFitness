//
//  ShowAdventuresViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray, Amanda H Harman, Weston E Jones on 4/18/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class ShowAdventuresCell: UITableViewCell{
    
    @IBOutlet weak var adventureName: UILabel!
    
    func setupCell(name: String!){
        adventureName.text = name
        
        let baseCell = UIImage(named: "BaseCell")!
        self.backgroundColor = UIColor(patternImage: baseCell.scaleUIImageToSize(baseCell, size: CGSizeMake(340, 110)))
        
        self.contentView.clipsToBounds = true;
    }
}

class ShowAdventuresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!

    let adventuresAPI = "AdventuresService"
    
    var RequestARGs = ""
    var EditARGs = ""
    
    
    func refreshList(notification: NSNotification){
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyData", object: nil)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let nib = UINib(nibName:"ShowAdventuresCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "ShowAdventuresCell")
        
        if AdventuresItems.count == 0 {
            getAdventures()
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AdventuresItems.count
    }
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ShowAdventuresCell = (tableView.dequeueReusableCellWithIdentifier("ShowAdventuresCell") as? ShowAdventuresCell)!
        
        let adventure = AdventuresItems[indexPath.row]
        
        cell.setupCell(adventure.name)
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.cyanColor()
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! ShowAdventuresCell
        tableView.beginUpdates()
        print(currentCell.adventureName.text)
        tableView.endUpdates()
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
    
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
