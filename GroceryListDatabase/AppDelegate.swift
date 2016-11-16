//
//  AppDelegate.swift
//  GroceryListDatabase
//
//  Created by rem{e}koh on 11/16/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var managedObjectContext :NSManagedObjectContext!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        initializeCoreData()
        
        guard let nc = self.window?.rootViewController as? UINavigationController else {
            fatalError("Root View Controller not found")
        }
        
        guard let storesTVC = nc.viewControllers.first as? GroceryStoresTableViewController else {
            fatalError("GroceryStoresTableViewController not found")
        }
        
        storesTVC.managedObjectContext = self.managedObjectContext
        
        return true
    }
    
    private func initializeCoreData() {
        
        guard let url = Bundle.main.url(forResource: "GroceryListModel", withExtension: "momd") else {
            fatalError("GroceryListModel not found")
        }
        
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: url) else {
            fatalError("ManagedObjectModel does not exist")
        }
        
        
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        
        let fileManager = FileManager()
        
        
        guard let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Documents Directory does not exist")
        }
        
        // Prints the database path on the output window
        print(documentsURL)
        
        let storeURL = documentsURL.appendingPathComponent("GroceryList.sqlite")
        
        print(storeURL)
        
        let options = [NSMigratePersistentStoresAutomaticallyOption: true,
                       NSInferMappingModelAutomaticallyOption: true]
        
        try! persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: options)
        
        let type = NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType
        
        self.managedObjectContext = NSManagedObjectContext(concurrencyType: type)
        
        self.managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

