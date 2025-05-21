//
//  ListFrogModel.swift
//  ListFrog
//
//  Created by John Campbell on 21/05/2025.
//

import Foundation

struct ListFrogModel {
    private(set) var items: Array<ListFrogItem>
    
    init(newItems: Array<ListFrogItem>) {
        items = newItems
    }
    init(itemNames: Array<String>) {
        var newItems: Array<ListFrogItem> = []
        for (index, value) in itemNames.enumerated() {
            newItems.append(ListFrogItem(id: index, caption: value, description: value))
        }
        items = newItems
    }
    
    func addItem(item: ListFrogItem){
        
    }
    func removeItem(item: ListFrogItem){
        
    }
    func toggleActive(item: ListFrogItem){
        
    }

    mutating func toggleSelect(_ card: ListFrogItem){
        let chosenIndex = index(of: card)
        items[chosenIndex].selected.toggle()
    }
    
    func index(of card: ListFrogItem) -> Int {
        for index in items.indices {
            if items[index].id == card.id {
                return index
            }
        }
        return -1
    }
    
    struct ListFrogItem: Identifiable {
        var id: Int
        var active = false
        var selected = false
        var caption: String
        var description: String
        
    }
}
