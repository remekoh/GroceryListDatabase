//
//  AddStoreListViewController.swift
//  GroceryListDatabase
//
//  Created by rem{e}koh on 11/16/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit
import CoreData

protocol AddStoreListViewControllerDelegate: class {
    
    func addStoreListViewControllerDidAddStore(store: GroceryStore)
    
}

class AddStoreListViewController: UIViewController{
    
    weak var delegate: AddStoreListViewControllerDelegate!
    
    var managedObjectContext: NSManagedObjectContext!
    
    
    @IBOutlet weak var addStoreNameTextField: UITextField!
    @IBOutlet weak var addStoreNumberTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addStoreButtonPressed(_ sender: AnyObject) {
        
        let newStore = NSEntityDescription.insertNewObject(forEntityName: "GroceryStore", into: self.managedObjectContext) as! GroceryStore
        
        newStore.storeName = addStoreNameTextField.text
        newStore.storeNumber = addStoreNumberTextField.text
        
        try! self.managedObjectContext.save()
        
        self.delegate.addStoreListViewControllerDidAddStore(store: newStore)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
     
 
 
 
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
