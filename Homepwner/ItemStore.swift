//
//  ItemStore.swift
//  Homepwner
//
//  Created by Michael Droz on 11/18/14.
//  Copyright (c) 2014 Michael Droz. All rights reserved.
//

import UIKit

class ItemStore: NSObject {
    
    var allItems: [Item] = []
   
}

func createItem() -> Item {
    let newItem = Item(random: true)
    
    allItems.append(newItem)
    
    return newItem
}
