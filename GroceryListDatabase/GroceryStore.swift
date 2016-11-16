//
//  GroceryStore.swift
//  GroceryListDatabase
//
//  Created by rem{e}koh on 11/16/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit
import CoreData

class GroceryStore: NSManagedObject {
    
    @NSManaged var storeName: String!
    @NSManaged var storeNumber: String!

}
