//
//  ToDoTableViewController.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/02/01.
//

import UIKit

var items: [ToDoItem] = []

class ToDoTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = ShopItemCache.getToDoItems()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoListCell", for: indexPath) as! ToDoTableViewCell
        
        let item = items[indexPath.row]
        cell.updateToDo(with: item)
        cell.showsReorderControl = true
   
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            ShopItemCache.setToDoItems(toDoItems: items)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedItem = items.remove(at: fromIndexPath.row)
        items.insert(movedItem, at: to.row)
        ShopItemCache.setToDoItems(toDoItems: items)
    }
    
//    MARK: - Segues to add / edit items
    @IBSegueAction func addEditToDoItem(_ coder: NSCoder, sender: Any?) -> AddEditToDoTableViewController? {
            if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell){
            // edit
         return AddEditToDoTableViewController(
            coder: coder,
            item: items[indexPath.row],
            addType: false)
        }else{
            // add
         return AddEditToDoTableViewController(
            coder: coder,
            item: nil,
            addType: true)
     }
     }
      
        @IBAction func unwindToToDoListTableView(segue: UIStoryboardSegue) {
            guard segue.identifier == "saveToDoUnwind",
                let sourceViewController = segue.source
                   as? AddEditToDoTableViewController,
                let item = sourceViewController.item else { return }
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // edit
                items[selectedIndexPath.row] = item
                ShopItemCache.setToDoItems(toDoItems: items)
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
               
            } else {
                // add
                let newIndexPath = IndexPath(row: items.count, section: 0)
                items.append(item)
                ShopItemCache.setToDoItems(toDoItems: items)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
              
            }
        }
}

