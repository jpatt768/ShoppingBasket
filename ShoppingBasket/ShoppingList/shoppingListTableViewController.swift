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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
//        cell.textLabel?.text = shoppingList.item
        cell.update(with: shoppingList)
        cell.showsReorderControl = true
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
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
//        }
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    /*

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
 }*/*/
    }

