//
//  EventsViewController.swift
//  SeaHawk Fitness
//
//  Created by Amanda Harman on 4/17/16.
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyData", object: nil)

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
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "EventsCell")
        searchBar.placeholder = "What event are you looking for?"
        refreshEvents.setTitle("Refresh Events", forState: UIControlState.Normal)
        
        getEvents()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return EventsItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: EventsCell = (collectionView.dequeueReusableCellWithReuseIdentifier("EventsCell", forIndexPath: indexPath) as? EventsCell)!
        
        let event = EventsItems[indexPath.row]
        
        cell.setupCell( event.eventName, date: event.day, time: event.time)
        return cell
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

    func refreshList(notification: NSNotification){
        self.collectionView.reloadData()
    }
    
    @IBAction func updateEvents(sender: UIButton) {
       let eventName = searchBar?.text
        RequestARGs = "name=" + eventName!
        EventsItems.removeAll()
        getEvents()
    }
        
}
