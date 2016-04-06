//
//  AdventureViewController.swift
//  SeaHawk Fitness
//
//  Created by Amanda Harman on 4/6/16.
//  Copyright © 2016 James Stinson Gray. All rights reserved.
//

import UIKit

class AdventuresCollectionCell: UICollectionViewCell
{
    @IBOutlet weak var adventureImage: UIImageView!
    @IBOutlet weak var adventureName: UILabel!
    @IBOutlet weak var adventureDate: UILabel!
    @IBOutlet weak var adventurePrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    let imageDirectoryURL = "http://webdev.cislabs.uncw.edu/~wj8170/SeahawkFitness/Images/"
    
    func setupCell(name: String!, date: String!, price: Int!){
        let imagePath = imageDirectoryURL + name.removeWhitespace() + ".jpg"
        
        adventureImage.loadImageFromURL(imagePath)
        adventureName.text = name
        adventureName.font = UIFont.boldSystemFontOfSize(18)
        
        adventureDate.text = date
        adventureDate.font = UIFont.boldSystemFontOfSize(18)
        
        adventurePrice.text = String(price)
        adventurePrice.font = UIFont.systemFontOfSize(15)
        adventurePrice.textColor = UIColor.grayColor()
    }
    
}

class AdventureViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var refreshButton: UIButton!
    
    let adventuresAPI = "SHAdventuresService"
    var RequestARGs = ""

    var items = [AdventuresTrip]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let nib = UINib(nibName: "AdventuresCollectionCell", bundle: nil)
        
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "AdventureCell")
        
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
        
        cell.setupCell( trip.name, date: trip.day, price: 10)
        return cell
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

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
