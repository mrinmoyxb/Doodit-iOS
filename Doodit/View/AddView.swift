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
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
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
            .alert(isPresented: $showAlert, content: getAlert)

    }
    
    // add text
    func saveTask(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textInput)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    // check the length of text, must be > 3
    func textIsAppropriate()-> Bool{
        if textInput.count < 3{
            alertTitle = "Your new task must be atleast 3 characters long!!! 🤓"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    // alert func
    func getAlert()-> Alert{
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack{
        AddView()
    }
}
