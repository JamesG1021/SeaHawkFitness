//
//  DeleteAdventuresViewController.swift
//  SeaHawk Fitness
//
//  Created by Amanda Harman on 4/18/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class DeleteAdventuresCell: UITableViewCell{
    
    @IBOutlet weak var adventureName: UILabel!
    
    func setupCell(name: String!){
        adventureName.text = name
        self.contentView.clipsToBounds = true;
    }
}

class DeleteAdventuresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!

    let adventuresAPI = "AdventuresService"
    var RequestARGs = ""
    var EditARGs = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name: "refreshMyData", object: nil)

        self.tableView.dataSource = self
        self.tableView.delegate = self
        let nib = UINib(nibName:"DeleteAdventuresCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "DeleteAdventuresCell")
        
        getAdventures()
        
    }
    
    
    func getAdventures(){
        
        makeDatabaseRequest(self.view, API: adventuresAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AdventuresItems.count
    }
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: DeleteAdventuresCell = (tableView.dequeueReusableCellWithIdentifier("DeleteAdventuresCell") as? DeleteAdventuresCell)!
        
        let adventure = AdventuresItems[indexPath.row]
        
        cell.setupCell(adventure.name)
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as! DeleteAdventuresCell
        tableView.beginUpdates()
        print(currentCell.adventureName.text)
        tableView.endUpdates()
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func refreshList(notification: NSNotification){
        self.tableView.reloadData()
    }

}
