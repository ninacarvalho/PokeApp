//
//  HomeView.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import FirebaseAuth
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject private var viewModel = CardListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                searchBar

                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.filteredCards) { card in
                            NavigationLink(destination: CardDetailView(card: card)) {
                                PokemonCardView(card: card)
                            }
                            .buttonStyle(PlainButtonStyle()) // prevents default blue highlight
                            .onAppear {
                                if card.id == viewModel.filteredCards.last?.id {
                                    Task { await viewModel.loadNextPage() }
                                }
                            }
                        }

                        if viewModel.isLoading {
                            ProgressView().padding()
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("TCG Pokédex")
            .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Logout") {
                            authViewModel.logout()
                        }
                    }
                }
        }
    }

    private var searchBar: some View {
        TextField("Search cards by name or type...", text: $viewModel.searchText)
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
            .onChange(of: viewModel.searchText) {
                viewModel.updateSearchText(viewModel.searchText)
            }
    }
}
