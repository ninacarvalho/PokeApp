//
//  SavedCardRowView.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import SwiftUI

struct SavedCardRowView: View {
    let card: SavedCardItem

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: card.imageURL)) { image in
                image.resizable()
                     .scaledToFit()
                     .frame(width: 70, height: 100)
                     .cornerRadius(8)
            } placeholder: {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 70, height: 100)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(card.name)
                    .font(.headline)

                Text("Status: \(card.cardStatus.rawValue)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("Evolution: \(card.evolutionFlag.rawValue)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
