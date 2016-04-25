//
//  EventsViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray, Amanda H Harman, Weston E Jones on 4/17/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var refreshEvents: UIButton!
    @IBOutlet weak var searchBar: UITextField!
    
    let eventsAPI = "EventsService"
    
    var RequestARGs = ""
    var EditARGs = ""
        
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    func refreshList(notification: NSNotification){
        
        self.collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let contentArea = UIImage(named: "ContentArea")!
        view.backgroundColor = UIColor(patternImage: contentArea.scaleUIImageToSize(contentArea, size: CGSizeMake(screenWidth, screenHeight)))
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyData", object: nil)
        //getImagesForModel()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.layer.cornerRadius = 8
        collectionView.layer.masksToBounds = true
        
        let layout: UICollectionViewFlowLayout = EventsCollectionViewFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        let nib = UINib(nibName: "EventsCell", bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "EventsCell")
        
        searchBar.placeholder = "What event are you looking for?"
        refreshEvents.setTitle("Refresh Events", forState: UIControlState.Normal)
        
        if EventsItems.count == 0 {
            getEvents()
        }
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return EventsItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: EventsCell = (collectionView.dequeueReusableCellWithReuseIdentifier("EventsCell", forIndexPath: indexPath) as? EventsCell)!
        
        let event = EventsItems[indexPath.row]
        
        cell.setupCell( event.eventName, date: event.day, time: event.time, image: event.eventImage)
        return cell
        
//        cell.eventImage.image = eventItem.equipImage
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let selectedEvent = EventsItems[indexPath.row]
        
        print("Event Name = " + selectedEvent.eventName)
        print("Event Date = " + selectedEvent.day)
        print("Event Time = " + selectedEvent.time)
        print("Event Description" + selectedEvent.description)
        
    }
    
    func getEvents(){
        makeDatabaseRequest(self.view, API: eventsAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
    }
    
    @IBAction func updateEvents(sender: UIButton) {
       let eventName = searchBar?.text
        RequestARGs = "name=" + eventName!
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
