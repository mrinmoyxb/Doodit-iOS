//
//  ListViewModel.swift
//  Doodit
//
//  Created by Mrinmoy Borah on 02/05/24.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var items: [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init(){
        getItems()
    }
    
    // read
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items = savedItems
    }
    
    // to delete an item or task
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    // to arrange an item or task
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    // to add a new task 
    func addItem(title: String){
        let newItem: ItemModel = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    // update items
    func updateItem(item: ItemModel){
        if let index = items.firstIndex (where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
        
    }
    
    // save items -> User Defaults
    func saveItems(){
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
    
}
