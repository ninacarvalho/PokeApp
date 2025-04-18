//
//  SavedCardListViewModel.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import Foundation

@MainActor
class SavedCardListViewModel: ObservableObject {
    @Published var savedCards: [SavedCardItem] = []

    func loadSavedCards() {
        FirestoreCardFetcher.shared.fetchSavedCards { [weak self] cards in
            Task {
                self?.savedCards = cards
            }
        }
    }
}
