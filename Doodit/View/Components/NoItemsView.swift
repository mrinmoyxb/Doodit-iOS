//
//  NoItemsView.swift
//  Doodit
//
//  Created by Mrinmoy Borah on 02/05/24.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                
                // heading 1
                Text("Add a task")
                    .font(.title)
                    .fontWeight(.semibold)
                
                // heading 2
                Text("Are you a productive person? I think you should click the add button and add a bunch of tasks to your todo lists")
                    .padding(.bottom, 20)
                
                // button
                NavigationLink(destination: AddView(), label: {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? .pink : .blue)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? .pink.opacity(0.7) : .blue.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 40 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }.multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }
    }
    
    func addAnimation(){
        guard !animate else{return}
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
            withAnimation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemsView()
}
