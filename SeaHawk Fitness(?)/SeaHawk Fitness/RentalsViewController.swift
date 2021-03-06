//
//  RentalsViewController.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones, James Stinson Gray  on 4/05/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

// Sets up the Rentals View Controller and specifies which API to use for the requests made, the use of the collection view, text fields, buttons, and the size of the icons thats will appear.
class RentalsViewController:
UIViewController, UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    let rentalsAPI = "RentalService"
    
    var RequestARGs = ""
    var EditARGs = ""

    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    // Refreshes the rentals page
    // -Parameter notifications: Information that will return from async call to notify this page its ready for refresh
    func refreshList(notification: NSNotification){
        
        self.collectionView.reloadData()
    }
    // Determines what must load on the page whenever this page is opened. sets the screen size, the collection view cells and the UI Image that is to be used.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refreshMyData", object: nil)
        
        let layout: UICollectionViewFlowLayout = RentalsCollectionViewFlowLayout()
        collectionView.setCollectionViewLayout(layout, animated: false)
 
        let nib = UINib(nibName: "RentalsCollectionCell", bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "RentalCell")
        
        let contentArea = UIImage(named: "ContentArea")!
        view.backgroundColor = UIColor(patternImage: contentArea.scaleUIImageToSize(contentArea, size: CGSizeMake(screenWidth, screenHeight)))
        
        // Do any additional setup after loading the view.
    }
    
    // specifies that what the view needs to load whenever a user segues into this page.
    override func viewWillAppear(animated: Bool) {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.layer.cornerRadius = 8
        collectionView.layer.masksToBounds = true
        
        searchBar.placeholder = "What did you want to rent today?"
        searchBar.delegate = self
        
        updateButton.setTitle("Refresh Rentals", forState: UIControlState.Normal)
        
        // This avoids a database recall by checking to see if the model is populated
        if RentalItems.count == 0 {
            getRentals()
        }
        //getImagesForModel()
    }
    
    // updates the rentals page upon request 
    // parameter sender: Links to button to create the request to refresh.
    @IBAction func updateRentals(sender: UIButton) {
        updateRentals()
    }
    
    // creates the collection view for the page
    // parameters collectionView: loads the UICollection view
    // parameters numberOfItemsInSection section: an int telling how many items need to be displayed on the page
    // returns the count of items in the list of rentals.
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RentalItems.count
    }
    
    //** This is a required function for creating a collection view.  It describes what each cell going into the collectionView looks like
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: RentalsCollectionCell = (collectionView.dequeueReusableCellWithReuseIdentifier("RentalCell", forIndexPath: indexPath) as? RentalsCollectionCell)!
        
        let rentalItem = RentalItems[indexPath.row]
        
        cell.setupCell(rentalItem.equipName, price: rentalItem.equipPrice, image: rentalItem.equipImage)
        
        //cell.rentalImage.image = UIImage.init(named: "NoImageFound.jpg")
        
        print(cell.rentalImage.image)
        
        return cell
    }
    
    // adds functionality to select item on the page
    // paramater collectionView: loads the UICollection View
    // parameter didSelectItemAtIndexPath indexPath: finds the item at the selected index to display it as selected so it can return the name, id and price of the rental for further use.
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let selectedRental = RentalItems[indexPath.row]
        
        print("Rental Name = " + selectedRental.equipName)
        print("Rental ID = ", selectedRental.equipID)
        print("Rental Price = ", selectedRental.equipPrice)
    }
    
    // retrieves the list of rentals
    func getRentals() {
        makeDatabaseRequest(self.view, API: rentalsAPI, EditARGs: EditARGs, RequestARGs: RequestARGs)
    }
    // updates the list of rentals
    func updateRentals() {
        let rentalName = searchBar?.text
        RequestARGs = "equipName=" + rentalName!
        getRentals()
    }
    // *** Class function of TextField delegate to describe when the keyboard should close
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
    //***  Not implemented.  Will be implemented using a popup view.
    @IBAction func PresentInfoView(sender: AnyObject) {
    }
    
    // Contacts the Webdev server to retrieve the appropriate image for the current item.
    // Not being utlized.  This will be worth implementing.
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
