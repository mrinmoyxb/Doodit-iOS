//
//  ListView.swift
//  Doodit
//
//  Created by Mrinmoy Borah on 01/05/24.

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                Text("No Items")
            }
            else{
                List{
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onMove(perform: listViewModel.moveItem) // to move items
                    .onDelete(perform: listViewModel.deleteItem) // to delete tasks
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        // navigation buttons: Edit and Add
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink{AddView()} label: {Text("Add")}
        )
    }
    
}

#Preview {
    NavigationStack{
        ListView()
    }.environmentObject(ListViewModel())
}


