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
        NavigationStack {
            cards
        }.searchable(text: $viewModel.searchTerm)
    }
    
    private var cards: some View {
        List {
            ForEach(viewModel.filteredItems) {
                card in
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
