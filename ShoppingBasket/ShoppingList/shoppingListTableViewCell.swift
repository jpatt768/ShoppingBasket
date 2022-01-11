//
//  shoppingBasketTableViewCell.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/05.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {

   
    
    @IBOutlet var shoppingListItemLabel: UILabel!
    @IBOutlet var shoppingListNoteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func update(with shoppingList: ShoppingList) {
        shoppingListItemLabel.text = shoppingList.item
        shoppingListNoteLabel.text = shoppingList.note
    }

}
