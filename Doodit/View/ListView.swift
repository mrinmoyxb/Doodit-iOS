//
//  ListView.swift
//  Doodit
//
//  Created by Mrinmoy Borah on 01/05/24.

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
    "This is task 1",
    "This is task 2",
    "This is task 3"
    ]
    var body: some View {
        List{
            ForEach(items, id: \.self){ item in
                ListRowView(title: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
            .navigationBarItems(
                leading: EditButton(),
                trailing: NavigationLink{
            Text("Destination")
                } label: {
                    Text("Add")
                })
    }
}

#Preview {
    NavigationStack{
        ListView()
    }
}


