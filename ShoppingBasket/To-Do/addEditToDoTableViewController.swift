//
//  addEditToDoTableViewController.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/11.
//

import UIKit

class AddEditToDoTableViewController: UITableViewController {


    @IBOutlet var toDoItemTextField: UITextField!
    
    var toDo: ToDoList?
    init?(coder: NSCoder, toDo: ToDoList?) {
        self.toDo = toDo
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if let toDo = toDo {
            toDoItemTextField.text = toDo.item
            title = "Edit Item"
        }else{
            title = "Add Item"
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue,
       sender: Any?) {
    
        guard segue.identifier == "saveUnwind" else { return }
    
        let item = toDoItemTextField.text!
     
        toDo = ToDoList(item: item)
    }

}
