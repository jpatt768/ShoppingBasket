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
    
    var item: ShopItem?
    let addType: Bool
    init?(coder: NSCoder, item: ShopItem? = nil, addType: Bool) {
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
            itemTextField.text = item?.name
            noteTextField.text = item?.note
            title = "Edit Item"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue,
       sender: Any?) {
    
        guard segue.identifier == "saveUnwind" else { return }
    
        let name = itemTextField.text!
        let note = noteTextField.text ?? ""
        item = ShopItem(name: name, note: note, favorite: item?.favorite ?? false)
    }
}
