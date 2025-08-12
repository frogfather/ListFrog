//
//  ContentView.swift
//  ListFrog
//
//  Created by John Campbell on 19/05/2025.
//

import SwiftUI

struct MainView: View {
    var listVM: ListFrogViewModel
    var body: some View {
        TabView {
            Tab("Active", systemImage: "house") {
                ActiveView(viewModel: listVM)
                }
            Tab("All items", systemImage: "gear") {
                LibraryView(viewModel: listVM)
                }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}








#Preview {
    MainView(listVM: ListFrogViewModel())
}
