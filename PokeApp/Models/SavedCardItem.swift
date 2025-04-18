//
//  SavedCardItem.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import Foundation

struct SavedCardItem: Identifiable {
    let id: String
    let name: String
    let imageURL: String
    let cardStatus: CardStatus
    let evolutionFlag: EvolutionFlag
}
