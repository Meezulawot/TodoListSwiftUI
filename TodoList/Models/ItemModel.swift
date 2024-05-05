//
//  ItemModel.swift
//  TodoList
//
//  Created by Meezu Lawot on 22/08/2023.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id: String
    var title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion()->  ItemModel{
        return ItemModel(id: id , title: title, isCompleted: !isCompleted)
    }
}
