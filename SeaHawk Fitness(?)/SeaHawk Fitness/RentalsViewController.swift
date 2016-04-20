//
//  RentalsViewController.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/5/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class RentalsViewController:
UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    let rentalsAPI = "RentalService"
    
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
        
        
        let layout: UICollectionViewFlowLayout = RentalsCollectionViewFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: false)
 
        let nib = UINib(nibName: "RentalsCollectionCell", bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "RentalCell")
        
        
        searchBar.placeholder = "What did you want to rent today?"
        
        updateButton.setTitle("Refresh Rentals", forState: UIControlState.Normal)
        
        getRentals()
        getImagesForModel()

        // Do any additional setup after loading the view.
    }
    
    func refreshList(notification: NSNotification){
        self.collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func updateRentals(sender: UIButton) {
        updateRentals()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RentalItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: RentalsCollectionCell = (collectionView.dequeueReusableCellWithReuseIdentifier("RentalCell", forIndexPath: indexPath) as? RentalsCollectionCell)!
        
        let rentalItem = RentalItems[indexPath.row]
        
        cell.setupCell(rentalItem.equipName, price: rentalItem.equipID)
        
        cell.rentalImage.image = rentalItem.equipImage
        
        print(cell.rentalImage.image)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let selectedRental = RentalItems[indexPath.row]
        
        print("Rental Name = " + selectedRental.equipName)
        print("Rental ID = ", selectedRental.equipID)
        print("Rental Price = ", selectedRental.equipPrice)
    }
    
    func getRentals() {
       makeDatabaseRequest(self.view, API: rentalsAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
    }
    
    func updateRentals() {
        let rentalName = searchBar?.text
        RequestARGs = "equipName=" + rentalName!
        RentalItems.removeAll()
        getRentals()
    }
    
    func getImagesForModel() {
        
        let session = NSURLSession.sharedSession()
        let imageServiceURL = "http://webdev.cislabs.uncw.edu/~wj8170/SeahawkFitness/API/ImageService.php"
        
        let imageSize = "150"
    
        for rentalItem in RentalItems {
            
            let RequestARGs = "?size=" + imageSize + "&name=" + rentalItem.equipName.removeWhitespace()
            let requestPath = imageServiceURL + RequestARGs
            print(requestPath)
            
            let imgURL: NSURL = NSURL(string: requestPath)!
            let request = NSMutableURLRequest(URL: imgURL)
            
            /*
             request.HTTPMethod = "GET"
             request.HTTPBody = getString
             */
            
            session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
                var imageData : NSData
                imageData = data!
                rentalItem.equipImage = UIImage.init(data: imageData)
                
                if error == nil {
                    rentalItem.equipImage = UIImage.init(named: "NoImageFound.jpg")
                    //UIImage(data: data!)
                }
                dispatch_async(dispatch_get_main_queue(),{
                    self.collectionView!.reloadData()
                })
            }).resume()
            
            //item.equipImage.loadImageFromURL(item.equipName.removeWhitespace(), imageSize: "150")
        }
    }
}
