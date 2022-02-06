//
//  ToDoTableViewCell.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/02/01.
//

import UIKit


class ToDoTableViewCell: UITableViewCell {
    
    @IBOutlet var toDoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    func updateToDo(with item: ToDoItem) {
       toDoLabel.text = item.toDoItem
        
    }
}
