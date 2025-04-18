//
//  MyCollectionView.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import FirebaseAuth
import SwiftUI

struct MyCollectionView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var viewModel = SavedCardListViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.savedCards) { card in
                        SavedCardRowView(card: card)
                    }
                }
                .padding()
            }
            .navigationTitle("My Collection")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Logout") {
                        authViewModel.logout()
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadSavedCards()
        }
    }
}
