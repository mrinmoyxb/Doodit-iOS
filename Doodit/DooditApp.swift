//
//  DooditApp.swift
//  Doodit
//
//  Created by Mrinmoy Borah on 01/05/24.
//

import SwiftUI

@main
struct DooditApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }.environmentObject(listViewModel)
        }
    }
}
