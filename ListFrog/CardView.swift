//
//  CardView.swift
//  ListFrog
//
//  Created by John Campbell on 25/05/2025.
//

import SwiftUI

struct CardView: View {
    var card: ListFrogModel.ListFrogItem
    var imageName: String
    var opacityFn: () -> CGFloat
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            base.fill(Color(red: 0.9, green: 0.75, blue: 0.7))
            base.strokeBorder(lineWidth: 2)
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                    .opacity(opacityFn())
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
    var card = ListFrogModel.ListFrogItem(
        id: 1,
        active: false,
        selected: false,
        caption: "Preview",
        description: "Test")
    CardView(card: card,imageName: "checkmark.circle",opacityFn: {0.8})
}
