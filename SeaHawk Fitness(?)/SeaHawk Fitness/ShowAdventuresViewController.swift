//
//  ShowAdventuresViewController.swift
//  SeaHawk Fitness
//
//  Created by Amanda Harman on 4/18/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class ShowAdventuresCell: UITableViewCell{
    
    @IBOutlet weak var adventureName: UILabel!
    
    func setupCell(name: String!){
        adventureName.text = name
        self.contentView.clipsToBounds = true;
    }
}

class ShowAdventuresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!

    let adventuresAPI = "SHAdventuresService"
    var RequestARGs = ""
    
    var items = [AdventuresTrip]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        let nib = UINib(nibName:"ShowAdventuresCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "ShowAdventuresCell")
        
        getAdventures()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ShowAdventuresCell = (tableView.dequeueReusableCellWithIdentifier("ShowAdventuresCell") as? ShowAdventuresCell)!
        
        let adventure = self.items[indexPath.row]
        
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
        return UITableViewAutomaticDimension
    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func getAdventures(){
        JSONService.sharedInstance.getJSON(adventuresAPI, ReqARGs: RequestARGs, onCompletion: { (json: JSON) in
            if let results = json.array {
                for entry in results {
                    self.items.append(AdventuresTrip(json: entry))
                    print(entry)
                }
                dispatch_async(dispatch_get_main_queue(),{
                    self.tableView!.reloadData()
                })
            }
        })

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
