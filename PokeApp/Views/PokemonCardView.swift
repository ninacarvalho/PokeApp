//
//  PokemonCardView.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import FirebaseAuth
import SwiftUI

struct PokemonCardView: View {
    let card: PokemonCard

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            AsyncImage(url: URL(string: card.images.small)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 110)
                    .cornerRadius(8)
                    .shadow(radius: 2)
            } placeholder: {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 80, height: 110)
            }

            VStack(alignment: .leading, spacing: 6) {
                Text(card.name)
                    .font(.headline)

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
                    ForEach(attacks.prefix(1), id: \.name) { attack in
                        Text("⚔️ \(attack.name) – \(attack.damage)")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}
