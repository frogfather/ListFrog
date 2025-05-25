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
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            base.fill(Color(red: 0.9, green: 0.75, blue: 0.7))
            base.strokeBorder(lineWidth: 2)
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                    .opacity(card.selected ? 0.8 : 0)
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
    ActiveView(viewModel: ListFrogViewModel())
}
