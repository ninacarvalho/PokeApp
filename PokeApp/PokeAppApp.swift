//
//  PokeAppApp.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import SwiftUI

@main
struct PokeAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
