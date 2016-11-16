//
//  GroceryStoresTableViewController.swift
//  GroceryListDatabase
//
//  Created by rem{e}koh on 11/16/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit
import CoreData

class GroceryStoresTableViewController: UITableViewController, AddStoreListViewControllerDelegate {
    
    var managedObjectContext: NSManagedObjectContext!
    
    var stores : [GroceryStore]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.stores = [GroceryStore]()
        
        populateStores()


    }
    
    func populateStores() {
        
        let request = NSFetchRequest<GroceryStore>(entityName: "GroceryStore")
        self.stores = try! self.managedObjectContext.fetch(request)
        
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return self.stores.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell", for: indexPath)

        let store = self.stores[indexPath.row]
        cell.textLabel?.text = store.storeName
        cell.detailTextLabel?.text = store.storeNumber
        
        return cell
    }
    
    func addStoreListViewControllerDidAddStore(store: GroceryStore) {
        
        populateStores()
        
       // try! self.managedObjectContext.save()
       // self.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let addStoreListVC = segue.destination as? AddStoreListViewController
        addStoreListVC?.delegate = self
        
        addStoreListVC?.managedObjectContext = self.managedObjectContext
    
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
       // stores.remove(at: indexPath.row)
        
        
        
        let store = self.stores[indexPath.row]
        
       // tableView.deleteRows(at: indexPaths, with: .automatic)
        
       // let store = NSEntityDescription.insertNewObject(forEntityName: "GroceryStore", into: self.managedObjectContext) as! GroceryStore
        
        self.managedObjectContext.delete(store)
        try! self.managedObjectContext.save()
        
        
        populateStores()
        
        
      //  self.tableView.isEditing = false
        
        
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
