//
//  toDoTableViewCell.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/11.
//

import UIKit

class toDoTableViewCell: UITableViewCell {

    @IBOutlet var toDoListItemLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func update(with toDo: ToDoList) {
        toDoListItemLabel.text = toDo.item
        
    }

}
