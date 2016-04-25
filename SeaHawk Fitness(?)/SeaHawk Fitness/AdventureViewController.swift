//
//  AdventureViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray, Amanda H Harman, Weston E Jones on 4/6/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class AdventureViewController:
UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    
    // ---------  OUTLETS
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var refreshButton: UIButton!
    
    // ---------- API STRINGS
    let adventuresAPI = "AdventuresService"
    
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
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyData", object: nil)
        
        let layout: UICollectionViewFlowLayout = AdventuresCollectionViewFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        let nib = UINib(nibName: "AdventuresCollectionCell", bundle: nil)
        
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "AdventureCell")
        
        let contentArea = UIImage(named: "ContentArea")!
        view.backgroundColor = UIColor(patternImage: contentArea.scaleUIImageToSize(contentArea, size: CGSizeMake(screenWidth, screenHeight)))

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.layer.cornerRadius = 8
        collectionView.layer.masksToBounds = true
        
        searchBar.placeholder = "What adventure are you looking for?"
        
        refreshButton.setTitle("Refresh Adventures", forState: UIControlState.Normal)
        
        if AdventuresItems.count == 0 {
            getAdventures()
        }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AdventuresItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: AdventuresCollectionCell = (collectionView.dequeueReusableCellWithReuseIdentifier("AdventureCell", forIndexPath: indexPath) as? AdventuresCollectionCell)!
        
        let trip = AdventuresItems[indexPath.row]
        
        cell.setupCell( trip.name, date: trip.day, price: 10, image: trip.adventureImage)
        //cell.backgroundColor = UIColor.cyanColor()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let selectectedAdventure = AdventuresItems[indexPath.row]
        
        print("Adventure Name = " + selectectedAdventure.name)
        print("Adventure Description = " + selectectedAdventure.description)
        print("Adventure Time = " + selectectedAdventure.time)
        
    }
    
    
    func getAdventures(){
        makeDatabaseRequest(self.view, API: adventuresAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
    }
            

    
    @IBAction func updateAdventures(sender: UIButton) {
        let adventureName = searchBar?.text
        RequestARGs = "name=" + adventureName!
        AdventuresItems.removeAll()
        getAdventures()
    }

}
