//
//  CardDetailView.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import SwiftUI

struct CardDetailView: View {
    let card: PokemonCard

    @State private var cardStatus: CardStatus = .none
    @State private var evolutionFlag: EvolutionFlag = .none

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: card.images.large)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                        .frame(height: 300)
                }

                Text(card.name)
                    .font(.title)
                    .bold()

                if let types = card.types {
                    Text("Type: \(types.joined(separator: ", "))")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                if let hp = card.hp {
                    Text("HP: \(hp)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                if let attacks = card.attacks {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Attacks:")
                            .font(.headline)

                        ForEach(attacks, id: \.name) { attack in
                            VStack(alignment: .leading) {
                                Text("⚔️ \(attack.name) – \(attack.damage)")
                                    .bold()
                                Text(attack.text)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }

                Divider()

                VStack(alignment: .leading, spacing: 12) {
                    Text("Collection Status").font(.headline)

                    Picker("Status", selection: $cardStatus) {
                        ForEach(CardStatus.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)

                    Picker("Evolution", selection: $evolutionFlag) {
                        ForEach(EvolutionFlag.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Button("💾 Save to Collection") {
                    CardStorageManager.shared.saveCard(card: card, status: cardStatus, flag: evolutionFlag)
                    FirebaseCardService.shared.saveCard(card: card, status: cardStatus, flag: evolutionFlag)

                }
                .buttonStyle(.borderedProminent)
                .padding(.top)
            }
            .padding()
        }
        .navigationTitle(card.name)
        .onAppear {
            if let saved = CardStorageManager.shared.card(forID: card.id) {
                cardStatus = CardStatus(rawValue: saved.cardStatus ?? "None") ?? .none
                evolutionFlag = EvolutionFlag(rawValue: saved.evolutionFlag ?? "None") ?? .none
            }
        }
    }
}
