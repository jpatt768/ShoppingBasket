//
//  AddEditToDoTableViewController.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/02/01.
//

import UIKit

class AddEditToDoTableViewController: UITableViewController {

    @IBOutlet var toDoTextField: UITextField!
    
    var item: ToDoItem?
    let addType: Bool
    init?(coder: NSCoder, item: ToDoItem? = nil, addType: Bool) {
        self.item = item
        self.addType = addType
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if addType {
            title = "Add Item"
        } else {
            toDoTextField.text = item?.toDoItem
            title = "Edit Item"
        }
    }

    override func prepare(for segue: UIStoryboardSegue,
       sender: Any?) {
    
        guard segue.identifier == "saveToDoUnwind" else { return }
    
        let toDoitem = toDoTextField.text!
        item = ToDoItem(toDoItem: toDoitem)
    }
}
