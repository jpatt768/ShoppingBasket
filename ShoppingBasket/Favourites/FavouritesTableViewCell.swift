//
//  FavouritesTableViewCell.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/13.
//

import UIKit

class FavouritesTableViewCell: UITableViewCell {

    @IBOutlet var favouriteItemLabel: UILabel!
    @IBOutlet var favouriteNoteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
