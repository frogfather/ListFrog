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
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            base.fill(Color(red: 0.9, green: 0.75, blue: 0.7))
            base.strokeBorder(lineWidth: 2)
            HStack {
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                    .opacity(card.active ? 0.8 : 0)
                VStack (alignment: .leading){
                    Text(card.caption)
                        .font(.largeTitle)
                    Text(card.description)
                        .opacity(0.8)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    LibraryView(viewModel: ListFrogViewModel())
}
