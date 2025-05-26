//
//  ListFrogModel.swift
//  ListFrog
//
//  Created by John Campbell on 21/05/2025.
//

import Foundation

struct ListFrogModel {
    private(set) var cards: Array<ListFrogItem>
    private(set) var searchTerm: String
    
    init(newItems: Array<ListFrogItem>) {
        cards = newItems
        searchTerm = ""
    }
    
    init(itemNames: Array<String>) {
        var newItems: Array<ListFrogItem> = []
        for (index, value) in itemNames.enumerated() {
            newItems.append(ListFrogItem(id: index, caption: value, description: value))
        }
        cards = newItems
        searchTerm = ""
    }
    
    func addItem(item: ListFrogItem){
        
    }
    
    func removeItem(item: ListFrogItem){
        
    }
    
    mutating func setSearchTerm(input: String) {
        searchTerm = input
    }
    
    mutating func toggleActive(_ card: ListFrogItem){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}) {
            cards[chosenIndex].active.toggle()
            if (!cards[chosenIndex].active) {
                cards[chosenIndex].selected = false
            }
        }
    }

    mutating func toggleSelect(_ card: ListFrogItem){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}) {
            cards[chosenIndex].selected.toggle()
        }
    }
    
    struct ListFrogItem: Identifiable {
        var id: Int
        var active = false
        var selected = false
        var caption: String
        var description: String
        
    }
}
