//
//  ItemModel.swift
//  Doodit
//
//  Created by Mrinmoy Borah on 01/05/24.
//

import Foundation
struct ItemModel: Identifiable{
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
