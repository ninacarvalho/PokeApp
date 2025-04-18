//
//  PokemonListResponse.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import Foundation

struct CardListResponse: Codable {
    let data: [PokemonCard]
}

struct PokemonCard: Codable, Identifiable {
    let id: String
    let name: String
    let types: [String]?
    let hp: String?
    let images: CardImages
    let attacks: [Attack]?

    struct CardImages: Codable {
        let small: String
        let large: String
    }

    struct Attack: Codable {
        let name: String
        let damage: String
        let text: String
    }
}
