//
//  PokeAppApp.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import SwiftUI
import Firebase

@main
struct PokeAppApp: App {
    @StateObject private var authViewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
            WindowGroup {
                RootView()
                    .environmentObject(authViewModel)
            }
        }
}

