//
//  shoppingBasketTableViewCell.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/05.
//

import UIKit

protocol ShoppingListTableViewCellDelegate: AnyObject {
    func onFavoriteUpdated(_ cell: ShoppingListTableViewCell, on: Bool)
}

class ShoppingListTableViewCell: UITableViewCell {
    
    @IBOutlet var favouriteButton: UIButton!
    @IBOutlet var shoppingListItemLabel: UILabel!
    @IBOutlet var shoppingListNoteLabel: UILabel!
    
    weak var delegate: ShoppingListTableViewCellDelegate?
    var index: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    
//    MARK: - Favourite heart animation
    @IBAction func favouriteButtonTapped() {
        let state = !favouriteButton.isSelected
        favouriteButton.isSelected = state
        delegate?.onFavoriteUpdated(self, on: state)
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
    func update(with item: ShopItem) {
        shoppingListItemLabel.text = item.name
        shoppingListNoteLabel.text = item.note
        favouriteButton.isSelected = item.favorite
    }

}
