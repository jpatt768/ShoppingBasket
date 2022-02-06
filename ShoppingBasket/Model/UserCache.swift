//
//  UserCache.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/01/22.
//

import Foundation

// Model used to cache data in the table view

struct ShopItemCache {
    static let shopItemKey = "shop.item.key"
    static let toDoKey = "todo.item.key"
    
    static func setItems(items: [ShopItem]) {
        let list = ShopItems(items: items)
        if let data = try? JSONEncoder().encode(list),
           let json = String(data: data, encoding: .utf8) {
            print("json \(json)")
            UserDefaults.standard.set(json, forKey: shopItemKey)
            UserDefaults.standard.synchronize()
        }
    }
    static func setToDoItems(toDoItems: [ToDoItem]) {
            let list = ToDoItems(toDoItems: toDoItems)
            if let data = try? JSONEncoder().encode(list),
               let json = String(data: data, encoding: .utf8) {
                print("json \(json)")
                UserDefaults.standard.set(json, forKey: toDoKey)
                UserDefaults.standard.synchronize()
            }
    }
    static func removeItem(idx: Int) {
        var items = getItems()
        items.remove(at: idx)
        UserDefaults.standard.set(items, forKey: shopItemKey)
        UserDefaults.standard.synchronize()
    }

    static func getItems() -> [ShopItem] {
        guard let json = UserDefaults.standard.string(forKey: shopItemKey) else {
            print("json is missing")
            return []
        }
        guard let data = json.data(using: .utf8) else {
            print("data is missing")
            return []
        }
        if let list = try? JSONDecoder().decode(ShopItems.self, from: data) {
            return list.items
            
        } else {
            return []
        }
    }
    static func removeToDoItem(idx: Int) {
        var items = getToDoItems()
        items.remove(at: idx)
        UserDefaults.standard.set(items, forKey: toDoKey)
        UserDefaults.standard.synchronize()
    }

    static func getToDoItems() -> [ToDoItem] {
        guard let json = UserDefaults.standard.string(forKey: shopItemKey) else {
            print("To-Do json is missing")
            return []
        }
        guard let data = json.data(using: .utf8) else {
            print("data is missing")
            return []
        }
        if let list = try? JSONDecoder().decode(ToDoItems.self, from: data) {
            return list.toDoItems
        } else {
            return []
        }
    }
}

