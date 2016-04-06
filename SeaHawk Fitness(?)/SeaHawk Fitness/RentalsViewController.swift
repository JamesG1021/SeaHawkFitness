//
//  RentalsViewController.swift
//  SeaHawk Fitness
//
//  Created by Weston E Jones on 4/5/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class RentalsCollectionCell : UICollectionViewCell
{
    @IBOutlet weak var rentalImage: UIImageView!
    @IBOutlet weak var rentalName: UILabel!
    @IBOutlet weak var rentalPrice: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    let imageDirectoryURL = "http://webdev.cislabs.uncw.edu/~wj8170/SeahawkFitness/Images/"
    
    
    func setupCell(name: String!, price: Int!)
    {
        // Extension functions used here.  SEE Utils folder.
        let imagePath = imageDirectoryURL + name.removeWhitespace() + ".jpg"  // String Extension Allows us to remove whitespace
                                            // We were getting a null pointer error from the urls with spaces(" ") in image name
        
        rentalImage.loadImageFromURL(imagePath)    // Function that extends UIImageView. pass it the URL of an image
        
        //rentalImage.image = UIImage (named: "Soccerball.jpg")
        rentalName.text = name
        rentalName.font = UIFont.boldSystemFontOfSize(18)
        
        rentalPrice.text = String(price)
        rentalPrice.font = UIFont.systemFontOfSize(15)
        rentalPrice.textColor = UIColor.grayColor()
        
    }
}

class RentalsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UITextField!
    
    @IBOutlet weak var updateButton: UIButton!
    
    let rentalsAPI = "RentalService"
    var RequestARGs = ""
    
    var items = [Rentals]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let nib = UINib(nibName: "RentalsCollectionCell", bundle: nil)
        
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "RentalItemCell")
        
        searchBar.placeholder = "What did you want to rent today?"
        
        updateButton.setTitle("Refresh Rentals", forState: UIControlState.Normal)
        
        getRentals()

        
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
        let cell: RentalsCollectionCell = (collectionView.dequeueReusableCellWithReuseIdentifier("RentalItemCell", forIndexPath: indexPath) as? RentalsCollectionCell)!
        
        let rentalItem = self.items[indexPath.row]
        
        cell.setupCell(rentalItem.equipName, price: rentalItem.equipID)
        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
