//
//  MainTabView.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            MyCollectionView()
                .tabItem {
                    Label("My Collection", systemImage: "star.fill")
                }
        }
    }
}

