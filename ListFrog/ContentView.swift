//
//  ContentView.swift
//  ListFrog
//
//  Created by John Campbell on 19/05/2025.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ListFrogViewModel
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
        }
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem()]) {
                ForEach(viewModel.libraryItems) { card in
                    CardView(card)
                        .onTapGesture {
                            viewModel.toggleSelected(item: card)
                        }
                        .padding()
            }
        }
    }
}

struct CardView: View {
    let content: ListFrogModel.ListFrogItem
    
    init(_ content: ListFrogModel.ListFrogItem) {
        self.content = content
    }
    
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
                    .opacity(content.selected ? 0.8 : 0)
                VStack (alignment: .leading){
                    Text(content.caption)
                        .font(.largeTitle)
                    Text(content.description)
                        .opacity(0.8)
                }
                Spacer()
            }
        }
    }
}








#Preview {
    ContentView(viewModel: ListFrogViewModel())
}
