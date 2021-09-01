//
//  InfoTableViewController.swift
//  FoodApp
//
//  Created by Chawan Saeed on 8/29/21.
//  Copyright © 2021 Chawan Saeed. All rights reserved.
//

import UIKit

class InfoTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var foodImage: UIImageView!
    @IBOutlet var tableView:UITableView!
    var food: Food!
    var foods = [Food] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodImage.image = UIImage(named: food.foodImage)
        tableView.reloadData()
        title = food.foodName
    }

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath) as! InfoTableViewCell

        switch indexPath.row {
        case 0:
            cell.label.text = food.foodName
            cell.nameLabel.text = "Food Name:"
        case 1:
            cell.label.text = food.neededTime
            cell.nameLabel.text = "Needed Time:"
        case 2:
            cell.label.text = food.ingredients
            cell.nameLabel.text = "Ingredients:"
        case 3:
            cell.label.text = food.steps
            cell.nameLabel.text = "Steps:"
        default:
            cell.label.text = "nil"
        }
        return cell
    }
    
    @IBAction func check() {
    
    }
}
