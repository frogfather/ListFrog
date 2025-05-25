//
//  ActiveCardView.swift
//  ListFrog
//
//  Created by John Campbell on 23/05/2025.
//

import SwiftUI

struct ActiveView: View {
    //Observed objects must never be instantiated here
    //They must always be passed in because they have to
    //be marked as state
    @ObservedObject var viewModel: ListFrogViewModel
    var body: some View {
        if viewModel.activeItems.isEmpty {
            VStack {
                Text("No items selected")
                Text("Swipe right to view the library")
                Text("->")
            }.font(.largeTitle)
        } else {
            VStack {
                ScrollView {
                    cards
                }
            }
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem()]) {
            ForEach(viewModel.activeItems) { card in
                ActiveCardView(card: card)
                        .onTapGesture {
                            viewModel.toggleSelected(item: card)
                        }
                        .padding()
            }
        }
    }
}


struct ActiveCardView: View {
    let card: ListFrogModel.ListFrogItem
    
    var body: some View {
        CardView(
            card: card,
            imageName: "checkmark.circle.fill",
            opacityFn: {card.selected ? 0.8 : 0})
    }
}







#Preview {
    ActiveView(viewModel: ListFrogViewModel())
}
