//
//  addEditShoppingItemsTableViewController.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/07.
//

import UIKit


class AddEditShoppingItemsTableViewController: UITableViewController {
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var noteTextField: UITextField!
    
    var shoppingList: ShoppingList?
    init?(coder: NSCoder, shoppingList: ShoppingList?) {
        self.shoppingList = shoppingList
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if let shoppingList = shoppingList {
            itemTextField.text = shoppingList.item
            noteTextField.text = shoppingList.note
            title = "Edit Item"
        }else{
            title = "Add Item"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue,
       sender: Any?) {
    
        guard segue.identifier == "saveUnwind" else { return }
    
        let item = itemTextField.text!
        let note = noteTextField.text ?? ""
     
        shoppingList = ShoppingList(item: item, note: note)
    }
}
