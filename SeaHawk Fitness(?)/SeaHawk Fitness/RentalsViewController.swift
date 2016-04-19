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
    
    var items = [Rentals]()

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func updateRentals(sender: UIButton) {
        updateRentals()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: RentalsCollectionCell = (collectionView.dequeueReusableCellWithReuseIdentifier("RentalCell", forIndexPath: indexPath) as? RentalsCollectionCell)!
        
        let rentalItem = self.items[indexPath.row]
        
        cell.setupCell(rentalItem.equipName, price: rentalItem.equipID)
        
        cell.rentalImage.image = rentalItem.equipImage
        
        print(cell.rentalImage.image)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let selectedRental = items[indexPath.row]
        
        print("Rental Name = " + selectedRental.equipName)
        print("Rental ID = ", selectedRental.equipID)
        print("Rental Price = ", selectedRental.equipPrice)
    }
    
    func getRentals() {
        
        JSONService.sharedInstance.getJSON (rentalsAPI, ReqARGs: RequestARGs, onCompletion: { (json: JSON) in
            if let results = json.array {
                for entry in results {
                    self.items.append(Rentals(json: entry))
                    print(entry)
                }
                dispatch_async(dispatch_get_main_queue(),{
                    self.collectionView!.reloadData()
                })
            }
        })
    }
    
    func updateRentals() {
        let rentalName = searchBar?.text
        RequestARGs = "equipName=" + rentalName!
        self.items.removeAll()
        getRentals()
    }
    
    func getImagesForModel() {
        
        let session = NSURLSession.sharedSession()
        let imageServiceURL = "http://webdev.cislabs.uncw.edu/~wj8170/SeahawkFitness/API/ImageService.php"
        
        let imageSize = "150"
    
        for rentalItem in items {
            
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
