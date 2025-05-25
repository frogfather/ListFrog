//
//  LibraryView.swift
//  ListFrog
//
//  Created by John Campbell on 22/05/2025.
//

import SwiftUI

struct LibraryView: View {
    @ObservedObject var viewModel: ListFrogViewModel
    var body: some View {
        if viewModel.libraryItems.isEmpty {
            VStack {
                Text("No items")
                Text("Start typing to add an item")
            }.font(.largeTitle)
        } else {
            VStack {
                Text("Heading here")
                ScrollView {
                    cards
                }
                Text("Input here")
            }
        }
    }
    
    private var cards: some View {
        LazyVGrid(columns: [GridItem()]) {
            ForEach(viewModel.libraryItems) { card in
                LibraryCardView(card: card)
                        .onTapGesture {
                            viewModel.toggleActive(item: card)
                        }
                        .padding()
            }
        }
    }
}


struct LibraryCardView: View {
    let card: ListFrogModel.ListFrogItem
    
    var body: some View {
        CardView(
            card: card,
            imageName: "checkmark.circle",
            opacityFn: {card.active ? 0.8 : 0})
    }
}

#Preview {
    LibraryView(viewModel: ListFrogViewModel())
}
