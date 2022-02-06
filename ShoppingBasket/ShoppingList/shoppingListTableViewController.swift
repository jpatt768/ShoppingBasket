//
//  shoppingListTableViewController.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/05.
//

import UIKit

class shoppingListTableViewController: UITableViewController {
   
    var items: [ShopItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = ShopItemCache.getItems()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingListCell", for: indexPath) as! ShoppingListTableViewCell

        let item = items[indexPath.row]
        cell.delegate = self
        cell.index = indexPath.row
        cell.update(with: item)
        
        cell.showsReorderControl = true
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            ShopItemCache.setItems(items: items)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedItem = items.remove(at: fromIndexPath.row)
        items.insert(movedItem, at: to.row)
        ShopItemCache.setItems(items: items)
    }
    
//    MARK: - Segues to add / edit items
    @IBSegueAction func addEditShoppingItem(_ coder: NSCoder, sender: Any?) -> AddEditShoppingItemsTableViewController? {
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell){
            // edit
         return AddEditShoppingItemsTableViewController(
            coder: coder,
            item: items[indexPath.row],
            addType: false)
        }else{
            // add
         return AddEditShoppingItemsTableViewController(
            coder: coder,
            item: nil,
            addType: true)
        }
     }
      
        @IBAction func unwindToShoppingListTableView(segue: UIStoryboardSegue) {
            guard segue.identifier == "saveUnwind",
                let sourceViewController = segue.source
                   as? AddEditShoppingItemsTableViewController,
                let item = sourceViewController.item else { return }

            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // edit
                items[selectedIndexPath.row] = item
                ShopItemCache.setItems(items: items)
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
               
            } else {
                // add
                let newIndexPath = IndexPath(row: items.count, section: 0)
                items.append(item)
                ShopItemCache.setItems(items: items)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
                
            }
        }
}

extension shoppingListTableViewController: ShoppingListTableViewCellDelegate {
    func onFavoriteUpdated(_ cell: ShoppingListTableViewCell, on: Bool) {
        items[cell.index].favorite = on
        ShopItemCache.setItems(items: items)
        cell.update(with: items[cell.index])
    }
}

