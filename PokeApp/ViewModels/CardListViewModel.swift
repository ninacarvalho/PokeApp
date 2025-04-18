//
//  CardListViewModel.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//
import Foundation

@MainActor
class CardListViewModel: ObservableObject {
    @Published var allCards: [PokemonCard] = []
    @Published var filteredCards: [PokemonCard] = []
    @Published var searchText: String = ""
    @Published var isLoading = false
    
    private var currentPage = 1
    private let pageSize = 20
    private var isLastPage = false
    
    init() {
        Task { await loadNextPage() }
    }
    
    func loadNextPage() async {
        guard !isLoading && !isLastPage else { return }
        
        isLoading = true
        do {
            let newCards = try await PokeTCGService.shared.fetchCards(page: currentPage, pageSize: pageSize)
            currentPage += 1
            isLastPage = newCards.isEmpty
            
            allCards += newCards
            applyFilters()
        } catch {
            print("❌ Failed to load cards: \(error)")
        }
        isLoading = false
    }
    
    func updateSearchText(_ text: String) {
        searchText = text
        applyFilters()
    }
    
    private func applyFilters() {
        if searchText.isEmpty {
            filteredCards = allCards
        } else {
            filteredCards = allCards.filter { card in
                card.name.localizedCaseInsensitiveContains(searchText) ||
                (card.types?.contains(where: { $0.localizedCaseInsensitiveContains(searchText) }) ?? false)
            }
        }
    }
}
