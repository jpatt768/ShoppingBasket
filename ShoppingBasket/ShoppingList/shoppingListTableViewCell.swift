//
//  shoppingBasketTableViewCell.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/05.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {
    var isFavourite: Bool = true {
        didSet {
            favouriteButton.isSelected = isFavourite
        }
    }
    
    @IBOutlet var favouriteButton: UIButton!
    @IBOutlet var shoppingListItemLabel: UILabel!
    @IBOutlet var shoppingListNoteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func favouriteButtonTapped() {
        isFavourite.toggle()
    }
    @IBAction func touchedDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3){
            self.favouriteButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }
    }
    @IBAction func touchedUpInside(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            self.favouriteButton.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
            self.favouriteButton.transform = CGAffineTransform.identity
        }) { (_) in
            self.favouriteButton.transform = CGAffineTransform.identity
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func update(with shoppingList: ShoppingList) {
        shoppingListItemLabel.text = shoppingList.item
        shoppingListNoteLabel.text = shoppingList.note
    }

}
