//
//  ListViewModel.swift
//  Doodit
//
//  Created by Mrinmoy Borah on 02/05/24.
//

import Foundation

class ListViewModel: ObservableObject{
    
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [ItemModel(title: "This is task1", isCompleted: false),
                        ItemModel(title: "This is task2", isCompleted: false),
                        ItemModel(title: "This is task3", isCompleted: false)]
        
        items.append(contentsOf: newItems)
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
}
