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

    // ---------- MODEL OBJECTS ARRAY
    var items = [AdventuresTrip]()
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
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
        
        let contentArea = UIImage(named: "ContentArea")!
        view.backgroundColor = UIColor(patternImage: contentArea.scaleUIImageToSize(contentArea, size: CGSizeMake(screenWidth, screenHeight)))
        
        searchBar.placeholder = "What adventure are you looking for?"
        
        refreshButton.setTitle("Refresh Adventures", forState: UIControlState.Normal)
        
        getAdventures()

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
        let cell: AdventuresCollectionCell = (collectionView.dequeueReusableCellWithReuseIdentifier("AdventureCell", forIndexPath: indexPath) as? AdventuresCollectionCell)!
        
        let trip = self.items[indexPath.row]
        
        cell.setupCell( trip.name, date: trip.day, price: 10, image: trip.adventureImage)
        //cell.backgroundColor = UIColor.cyanColor()
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let selectectedAdventure = items[indexPath.row]
        
        print("Adventure Name = " + selectectedAdventure.name)
        print("Adventure Description = " + selectectedAdventure.description)
        print("Adventure Time = " + selectectedAdventure.time)
        
    }
    
    
    func getAdventures(){
        JSONService.sharedInstance.getJSON (adventuresAPI, ReqARGs: RequestARGs, onCompletion: {(json:JSON) in
            if let results = json.array {
                for entry in results {
                    self.items.append(AdventuresTrip(json: entry))
                    print(entry)
                }
                dispatch_async(dispatch_get_main_queue(), {self.collectionView!.reloadData()})
            }
        })
    }
            

    
    @IBAction func updateAdventures(sender: UIButton) {
        let adventureName = searchBar?.text
        RequestARGs = "name=" + adventureName!
        self.items.removeAll()
        getAdventures()
    }

}
