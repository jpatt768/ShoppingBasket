//
//  toDoTableViewController.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/11.
//

import UIKit

class toDoTableViewController: UITableViewController {
    var toDoItems: [ToDoList] = [
    ToDoList(item: "Dummy Item")
    ]
    
        override func viewDidLoad() {
            super.viewDidLoad()

        }

        // MARK: - Table view data source

        override func numberOfSections(in tableView: UITableView) -> Int {
        
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return toDoItems.count
        }
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            tableView.reloadData()
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "toDoListCell", for: indexPath) as! toDoTableViewCell

            let toDo = toDoItems[indexPath.row]
            cell.update(with: toDo)
            cell.showsReorderControl = true
            return cell
        }

        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                toDoItems.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .left)
            }
        }
        
        override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
            let movedItem = toDoItems.remove(at: fromIndexPath.row)
            toDoItems.insert(movedItem, at: to.row)
        }
        
//  MARK: - Segues to add/edit items
    @IBSegueAction func addEditToDoSegue(_ coder: NSCoder, sender: Any?) -> AddEditToDoTableViewController? {
        if let cell = sender as? UITableViewCell,
                   let indexPath = tableView.indexPath(for: cell){
                 let itemToEdit = toDoItems[indexPath.row]
                 return AddEditToDoTableViewController(coder: coder, toDo: itemToEdit)
                }else{
                 return AddEditToDoTableViewController(coder: coder, toDo: nil)
             }
    }
          
            @IBAction func unwindToShoppingListTableView(segue: UIStoryboardSegue) {
                guard segue.identifier == "saveUnwind",
                    let sourceViewController = segue.source
                       as? AddEditToDoTableViewController,
                    let toDo = sourceViewController.toDo else { return }

                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    toDoItems[selectedIndexPath.row] = toDo
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                } else {
                    let newIndexPath = IndexPath(row: toDoItems.count, section: 0)
                    toDoItems.append(toDo)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }

    }

