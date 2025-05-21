//
//  ListFrogApp.swift
//  ListFrog
//
//  Created by John Campbell on 19/05/2025.
//

import SwiftUI

@main
struct ListFrogApp: App {
    @StateObject var list = ListFrogViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: list)
        }
    }
}
