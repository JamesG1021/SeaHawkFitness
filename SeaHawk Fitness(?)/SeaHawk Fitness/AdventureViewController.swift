//
//  AdventureViewController.swift
//  SeaHawk Fitness
//
//  Created by Amanda Harman on 4/6/16.
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyData", object: nil)
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clearColor()

        
        let layout: UICollectionViewFlowLayout = AdventuresCollectionViewFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        let nib = UINib(nibName: "AdventuresCollectionCell", bundle: nil)
        
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "AdventureCell")
        
        searchBar.placeholder = "What adventure are you looking for?"
        
        refreshButton.setTitle("Refresh Adventures", forState: UIControlState.Normal)
        
        getAdventures()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AdventuresItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: AdventuresCollectionCell = (collectionView.dequeueReusableCellWithReuseIdentifier("AdventureCell", forIndexPath: indexPath) as? AdventuresCollectionCell)!
        
        let trip = AdventuresItems[indexPath.row]
        
        cell.setupCell( trip.name, date: trip.day, price: 10)
        
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
            
    func refreshList(notification: NSNotification){
        self.collectionView.reloadData()
    }
    
    @IBAction func updateAdventures(sender: UIButton) {
        let name = searchBar?.text
        RequestARGs = "name=" + name!
        AdventuresItems.removeAll()
        getAdventures()
    }

}
