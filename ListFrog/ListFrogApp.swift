//
//  ListFrogApp.swift
//  ListFrog
//
//  Created by John Campbell on 19/05/2025.
//

import SwiftUI

@main
struct ListFrogApp: App {
    //the view model must be marked as state and passed to
    //the components that use it
    //Marking it as @StateObject defines it as the
    //single source of truth
    @StateObject private var list = ListFrogViewModel()
    var body: some Scene {
        WindowGroup {
            MainView(listVM: list)
        }
    }
}
