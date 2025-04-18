//
//  CardFlags.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

enum CardStatus: String, CaseIterable, Codable {
    case none = "None"
    case want = "Want"
    case have = "Have"
}

enum EvolutionFlag: String, CaseIterable, Codable {
    case none = "None"
    case needToEvolve = "Need to Evolve"
    case finalEvolution = "Final Evolution"
}
