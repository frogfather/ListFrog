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
            ActiveView(viewModel: listVM)
            LibraryView(viewModel: listVM)
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}








#Preview {
    MainView(listVM: ListFrogViewModel())
}
