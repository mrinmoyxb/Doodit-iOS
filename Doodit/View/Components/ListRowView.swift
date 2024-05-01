//
//  ListRowView.swift
//  Doodit
//
//  Created by Mrinmoy Borah on 01/05/24.
//

import Foundation
import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}
