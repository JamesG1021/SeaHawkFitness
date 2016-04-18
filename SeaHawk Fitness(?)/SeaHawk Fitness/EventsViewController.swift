//
//  EventsViewController.swift
//  SeaHawk Fitness
//
//  Created by Amanda Harman on 4/17/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit


class EventsCell: UICollectionViewCell{
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    let imageDirectoryURL = "http://webdev.cislabs.uncw.edu/~wj8170/SeahawkFitness/Images/"
    
    
    func setupCell(name: String!, date: String!, time: String!){
        //let imagePath = imageDirectoryURL + name.removeWhitespace() + ".jpg"
        //eventImage.loadImageFromURL(imagePath)
        
        eventName.text = name
        eventName.font = UIFont.boldSystemFontOfSize(18)
        
        eventDate.text = date
        eventDate.font = UIFont.boldSystemFontOfSize(18)
        
        eventTime.text = time
        eventTime.font = UIFont.systemFontOfSize(15)

    }

}

class EventsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var refreshEvents: UIButton!
    @IBOutlet weak var searchBar: UITextField!
    
    let eventsAPI = "EventService"
    var RequestARGs = ""
    
    var items = [LargeEvent]()
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.layer.backgroundColor = UIColor.clearColor().CGColor
        collectionView.backgroundColor = UIColor.clearColor()
        
        let layout: UICollectionViewFlowLayout = EventsCollectionViewFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: false)

        let nib = UINib(nibName: "EventsCell", bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "EventCell")
        searchBar.placeholder = "What event are you looking for?"
        refreshEvents.setTitle("Refresh Events", forState: UIControlState.Normal)
        
        getEvents()
            
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: EventsCell = (collectionView.dequeueReusableCellWithReuseIdentifier("EventsCell", forIndexPath: indexPath) as? EventsCell)!
        
        let event = self.items[indexPath.row]
        
        cell.setupCell( event.eventName, date: event.day, time: event.time)
        cell.backgroundColor = UIColor.cyanColor()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let selectedEvent = items[indexPath.row]
        
        print("Event Name = " + selectedEvent.eventName)
        print("Event Date = " + selectedEvent.day)
        print("Event Time = " + selectedEvent.time)
        print("Event Description" + selectedEvent.description)
        
    }
    
    func getEvents(){
        JSONService.sharedInstance.getJSON(eventsAPI, ReqARGs: RequestARGs, onCompletion: {(json:JSON) in
            if let results = json.array {
                for entry in results {
                    self.items.append(LargeEvent(json: entry))
                    print(entry)
                }
                dispatch_async(dispatch_get_main_queue(), {self.collectionView!.reloadData()})
            }
        })}

    
    @IBAction func updateEvents(sender: UIButton) {
       let eventName = searchBar?.text
        RequestARGs = "name=" + eventName!
        self.items.removeAll()
        getEvents()
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
