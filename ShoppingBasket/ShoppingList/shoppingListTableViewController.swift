//
//  shoppingListTableViewController.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/05.
//

import UIKit

var shoppingItems: [ShoppingList] = [
ShoppingList(item: "Dummy Item", note: "Dummy Note")
]

class shoppingListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return shoppingItems.count
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as! ShoppingListTableViewCell

        let shoppingList = shoppingItems[indexPath.row]
        cell.update(with: shoppingList)
        
        cell.showsReorderControl = true
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedItem = shoppingItems.remove(at: fromIndexPath.row)
        shoppingItems.insert(movedItem, at: to.row)
    }
    
//    MARK: - Segues to add / edit items
    @IBSegueAction func addEditShoppingItem(_ coder: NSCoder, sender: Any?) -> AddEditShoppingItemsTableViewController? {
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell){
         let itemToEdit = shoppingItems[indexPath.row]
         return AddEditShoppingItemsTableViewController(coder: coder, shoppingList: itemToEdit)
        }else{
         return AddEditShoppingItemsTableViewController(coder: coder, shoppingList: nil)
     }
     }
      
        @IBAction func unwindToShoppingListTableView(segue: UIStoryboardSegue) {
            guard segue.identifier == "saveUnwind",
                let sourceViewController = segue.source
                   as? AddEditShoppingItemsTableViewController,
                let shoppingList = sourceViewController.shoppingList else { return }

            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                shoppingItems[selectedIndexPath.row] = shoppingList
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: shoppingItems.count, section: 0)
                shoppingItems.append(shoppingList)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
}

    

