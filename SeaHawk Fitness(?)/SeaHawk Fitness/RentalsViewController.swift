//
//  RentalsViewController.swift
//  SeaHawk Fitness
//
//  Created by James Stinson Gray, Amanda H Harman, Weston E Jones on 4/5/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

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
    
    func refreshList(notification: NSNotification){
        
        self.collectionView.reloadData()
    }
    
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

    @IBAction func updateRentals(sender: UIButton) {
        updateRentals()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RentalItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: RentalsCollectionCell = (collectionView.dequeueReusableCellWithReuseIdentifier("RentalCell", forIndexPath: indexPath) as? RentalsCollectionCell)!
        
        let rentalItem = RentalItems[indexPath.row]
        
        cell.setupCell(rentalItem.equipName, price: rentalItem.equipPrice, image: rentalItem.equipImage)
        
        //cell.rentalImage.image = UIImage.init(named: "NoImageFound.jpg")
        
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
        getRentals()
    }
    
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

    @IBAction func PresentInfoView(sender: AnyObject) {
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
