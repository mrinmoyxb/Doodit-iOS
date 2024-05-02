//
//  ListView.swift
//  Doodit
//
//  Created by Mrinmoy Borah on 01/05/24.

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [ItemModel(title: "This is task1", isCompleted: false), ItemModel(title: "This is task2", isCompleted: true)]
    
    var body: some View {
        List{
            ForEach(items){ item in
                ListRowView(item: item)
            }.onDelete(perform: deleteItem)
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink{AddView()} label: {Text("Add")}
        )
    }
    
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
}

#Preview {
    NavigationStack{
        ListView()
    }
}


