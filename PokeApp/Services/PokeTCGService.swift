//
//  PokeTCGService.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//
import Foundation

class PokeTCGService {
    static let shared = PokeTCGService()
    private let baseURL = "https://api.pokemontcg.io/v2"

    private let apiKey = "fb0e8138-4b95-403f-ad49-d8d19a16a33d"

    func fetchCards(page: Int = 1, pageSize: Int = 20) async throws -> [PokemonCard] {
        let url = URL(string: "\(baseURL)/cards?page=\(page)&pageSize=\(pageSize)")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key") 

        let (data, _) = try await URLSession.shared.data(for: request)
        let decoded = try JSONDecoder().decode(CardListResponse.self, from: data)
        return decoded.data
    }
}
