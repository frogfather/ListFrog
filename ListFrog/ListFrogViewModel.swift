//
//  ListFrogViewModel.swift
//  ListFrog
//
//  Created by John Campbell on 21/05/2025.
//

import SwiftUI

class ListFrogViewModel: ObservableObject {
    
    private static let labels = ["test1","test2","test3","test4","test5","test6","test7","test8","test9","test10","test11","test12","test13","test14"]
    
    private static func createList() -> ListFrogModel {
        return ListFrogModel(itemNames: labels)
    }
    
    @Published private var listModel: ListFrogModel = createList()
    
    var searchTerm: String = "" {
        didSet {
            if searchTerm != oldValue {
                print("Search term changed to \(searchTerm)")
                listModel.filterCards(searchTerm: searchTerm)
            }
        }
    }
    
    var libraryItems: Array<ListFrogModel.ListFrogItem> {
        return listModel.cards
    }
    var activeItems: Array<ListFrogModel.ListFrogItem> {
        return listModel.cards.filter({$0.active})
    }
    
    var filteredItems: Array<ListFrogModel.ListFrogItem> {
        return listModel.filteredCards
    }

    func addLibraryItem(item: ListFrogModel.ListFrogItem) {
        listModel.addItem(item: item)
    }
    func removeLibraryItem(item: ListFrogModel.ListFrogItem) {
        listModel.removeItem(item: item)
    }
    func toggleActive(item: ListFrogModel.ListFrogItem) {
        listModel.toggleActive(item)
    }
    func toggleSelected(item: ListFrogModel.ListFrogItem) {
        listModel.toggleSelect(item)
    }
    
    func clearActive() {
        print("clear all")
    }
}
