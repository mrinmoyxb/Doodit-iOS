//
//  ListRowView.swift
//  Doodit
//
//  Created by Mrinmoy Borah on 01/05/24.
//

import Foundation
import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        } 
        .font(.title2)
        .padding(.vertical, 8)
    }
}
