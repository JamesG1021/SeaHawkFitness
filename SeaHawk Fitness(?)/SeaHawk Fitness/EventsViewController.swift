//
//  EventsViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray, Amanda H Harman, Weston E Jones on 4/17/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

// Initializes the events View Controller with the correct API as well as the collection view, text fields, and buttons
class EventsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate, UICollectionViewDelegateFlowLayout {

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
    
    // Determines what must load on the page every time it's accessed as well as set the screen constraints
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let contentArea = UIImage(named: "ContentArea")!
        view.backgroundColor = UIColor(patternImage: contentArea.scaleUIImageToSize(contentArea, size: CGSizeMake(screenWidth, screenHeight)))
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyData", object: nil)
        //getImagesForModel()
    }
    
    // specifies what the page must load whenever a user is segueing into it.
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
        searchBar.delegate = self
        
        refreshEvents.setTitle("Refresh Events", forState: UIControlState.Normal)
        
        if EventsItems.count == 0 {
            getEvents()
        }
    }

    // creates the collection view to be used by the page
    // parameter collectionView: specifies which ui view to use for the page
    // parameter numberOfItemsInSection section: an int that is equal to the number of items in the list.
    // returns the number of items in that list.
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return EventsItems.count
    }
    //***
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: EventsCell = (collectionView.dequeueReusableCellWithReuseIdentifier("EventsCell", forIndexPath: indexPath) as? EventsCell)!
        
        let event = EventsItems[indexPath.row]
        
        cell.setupCell( event.eventName, date: event.day, time: event.time, image: event.eventImage)
        return cell
        
//        cell.eventImage.image = eventItem.equipImage
    }
    
    // Determines what item the user has selected on that page and then prints out the name, date, time and description for further scheduling use.
    // parameter collectionView: specifies which ui view to use for the page
    // parameter didSelectItemAtIndexPath indexPath: the current item that is selected in the list.
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        //let selectedCell:UICollectionViewCell = collectionView.cellForItemAtIndexPath(indexPath)!
        //selectedCell.contentView.backgroundColor = UIColor(red: 90/256, green: 255/256, blue: 255/256, alpha: 0.45)
        
        let selectedEvent = EventsItems[indexPath.row]
        
        print("Event Name = " + selectedEvent.eventName)
        print("Event Date = " + selectedEvent.day)
        print("Event Time = " + selectedEvent.time)
        print("Event Description" + selectedEvent.description)
    }
    
    // Determines what item the user has deselected on that page
    // parameter collectionView: specifies which ui view to use for the page
    // parameter didDeselectItemAtIndexPath indexPath: the item in the list that is no longer being selected.
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        //let cellToDeselect:UICollectionViewCell = collectionView.cellForItemAtIndexPath(indexPath)!
        //cellToDeselect.contentView.backgroundColor = UIColor.clearColor()
    }
    
    // retrieves the list of events from the list
    func getEvents(){
        makeDatabaseRequest(self.view, API: eventsAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
    }
    
    // Allows the user to search events based on name
    // parameter sender: links to the button used to submit the querry
    @IBAction func updateEvents(sender: UIButton) {
       let eventName = searchBar?.text
        RequestARGs = "name=" + eventName!
        getEvents()
    }
    
    // ****
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

    @IBAction func PresentInfoScreen(sender: AnyObject) {
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
