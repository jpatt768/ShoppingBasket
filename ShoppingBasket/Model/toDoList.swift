//
//  toDoList.swift
//  ShoppingBasket
//
//  Created by Jayden Patterson on 2022/02/01.
//

import Foundation

public struct ToDoItem: Codable {
    var toDoItem: String
}

struct ToDoItems: Codable {
    let toDoItems: [ToDoItem]
}
