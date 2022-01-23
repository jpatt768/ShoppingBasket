//
//  shoppingBasket.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/05.
//

import Foundation

public struct ShopItem: Codable {
    var name: String
    var note: String
    var favorite: Bool
}

struct ShopItems: Codable {
    let items: [ShopItem]
}

