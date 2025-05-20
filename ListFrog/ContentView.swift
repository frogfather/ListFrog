//
//  ContentView.swift
//  ListFrog
//
//  Created by John Campbell on 19/05/2025.
//

import SwiftUI

struct ContentView: View {
    let labels = ["test1","test2","test3","test4","test5","test6","test7","test8","test9","test10","test11","test12","test13","test14"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem()]) {
            ForEach(0..<cardCount, id: \.self) { index in CardView(content: labels[index])
            }
        }
    }
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > labels.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            base.fill(.white)
            base.strokeBorder(lineWidth: 2)
            Text(content).font(.largeTitle)
        }
    }
}








#Preview {
    ContentView()
}
