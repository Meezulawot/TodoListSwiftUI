//
//  ListViewModel.swift
//  TodoList
//
//  Created by Meezu Lawot on 22/08/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items:[ItemModel] = []{
        didSet{
            saveItemsInUserDefault()
        }
    }
    let itemsKey: String = "itemList"
    
    init() {
        getItems()
    }
    
    func getItems(){
//        let newItems = [
//            ItemModel(title: "First Item", isCompleted: true),
//            ItemModel(title: "Second Item", isCompleted: false),
//            ItemModel(title: "Third Item", isCompleted: false)
//        ]
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{
            return
        }
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex (where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItemsInUserDefault(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
