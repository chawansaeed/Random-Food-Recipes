//
//  FirstView.swift
//  FoodApp
//
//  Created by Chawan Saeed on 8/27/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class FirstView: UITableViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    var foods = [Food]()
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
        collectionView.reloadData()
        readJsonFile("foods")
        print("view loaded")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style:
            .Plain, target: nil, action: nil)
    }
    
    func readJsonFile(path: String) {
        if let filePath = NSBundle.mainBundle().pathForResource(path, ofType: "json") {
            let data = NSData(contentsOfFile: filePath)
//            print("Data: \(data)")
            parseJsonFile(data!)
        }
    }
    
    func parseJsonFile(data: NSData) -> [Food] {
        do {
            let decodedData = try NSJSONSerialization.JSONObjectWithData(data, options: [ ]) as? NSDictionary

            // Parse json data: 
            let jsonFoods = decodedData?["foods"] as! [AnyObject]
        
            for jsonFood in jsonFoods {
                let food = Food()
                food.foodImage = jsonFood["foodImage"] as! String
                food.foodName = jsonFood["foodName"] as! String
                food.ingredients = jsonFood["ingredients"] as! String
                food.steps = jsonFood["steps"] as! String
                food.neededTime = jsonFood["time"] as! String
                foods.append(food)
            }
            
        } catch { "Could not parse data, the problem is: \(error)" }
        return foods
    }
    
    // CollectionView:
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foods.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath) as! CollectionViewCell
        cell.foodImage.image = UIImage(named: foods[indexPath.row].foodImage)
        cell.foodImage.layer.cornerRadius = 30.0
        cell.foodImage.clipsToBounds = true
        cell.review.text = "It is working fine."
        return cell
    }
    
    // Table View:
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foods.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) as! TableViewCell
        cell.foodImage.image = UIImage(named: self.foods[indexPath.row].foodImage)
        cell.foodNameLabel.text = String(self.foods[indexPath.row].foodName)
        cell.foodImage.layer.cornerRadius = 25.0
        cell.foodImage.clipsToBounds = true
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRecipe" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationVC = segue.destinationViewController as! InfoTableViewController
                destinationVC.food = foods[indexPath.row]
            }
        }
    }
}
