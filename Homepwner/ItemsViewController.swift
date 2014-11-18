//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Michael Droz on 11/18/14.
//  Copyright (c) 2014 Michael Droz. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        //Load the NIB file
        if let nib = UINib(nibName: "ItemCell", bundle: nil) {
            //Register this NIB, which contains the cell
            tableView.registerNib(nib, forCellReuseIdentifier: "ItemCell")
        }
    }
    
    let itemStore: ItemStore
    
    init(itemSore: ItemStore) {
        self.itemStore = itemStore
        super.init(nibName: nil, bundle: nil)
        
        for _ in 0..<5 {
            self.itemStore.createItem()
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Create an instance of UITableView Cell, with default appearance
        //let cell = UITableViewCell(style: .Default, reuseIdentifier: "UITableViewCell")
        //Get a nwe or recycled cell
       // let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as UITableViewCell
        
        //Get a new or recycled cell
        let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell", forIndexPath: indexPath) as ItemCell
        
        //Set the text on the cell with the description of the item
        //that is at the nth index of items, where n = row this cell
        //will appear in on the tableview
        let item = itemStore.allItems[indexPath.row]
        
       // cell!.textLabel?.text = item.name
        
        //return cell!
        
        //cell.textLabel?.text = item.name
        //Configure the cell with the Item
        cell.nameLabel.text = item.name
        cell.serialNumberLabel.text = item.serialNumber
        if let value = item.valueInDollars {
            cell.valueLabel.text = "$\(value)"
        }
        else {
            cell.valueLabel.text = ""
        }
        return cell
    }
   
}
