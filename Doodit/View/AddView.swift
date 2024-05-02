//
//  AddView.swift
//  Doodit
//
//  Created by Mrinmoy Borah on 01/05/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textInput: String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Write down your task...", text: $textInput)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.taskbox)
                    .cornerRadius(10)
                
                Button(action: saveTask, label: {Text("SAVE")
                        .font(.headline)
                        .bold()
                        .frame(maxWidth: .infinity).frame(height: 55)
                }).buttonStyle(.borderedProminent)
                
            }.padding(14)
        }.navigationTitle("Add your task 🎯")

    }
    
    func saveTask(){
        listViewModel.addItem(title: textInput)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    NavigationStack{
        AddView()
    }
}
