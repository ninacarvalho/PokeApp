//
//  CardStorageManager.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import Foundation
import CoreData
import SwiftUI

class CardStorageManager {
    static let shared = CardStorageManager()

    private let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "PokeApp")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data store: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext { container.viewContext }

    // Save or update a card
    func saveCard(card: PokemonCard, status: CardStatus, flag: EvolutionFlag) {
        let fetchRequest: NSFetchRequest<SavedCard> = SavedCard.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", card.id)

        let savedCard = (try? context.fetch(fetchRequest).first) ?? SavedCard(context: context)
        savedCard.id = card.id
        savedCard.name = card.name
        savedCard.imageURL = card.images.small
        savedCard.cardStatus = status.rawValue
        savedCard.evolutionFlag = flag.rawValue

        try? context.save()
    }

    func fetchAllCards() -> [SavedCard] {
        let request: NSFetchRequest<SavedCard> = SavedCard.fetchRequest()
        return (try? context.fetch(request)) ?? []
    }

    func deleteCard(withID id: String) {
        let request: NSFetchRequest<SavedCard> = SavedCard.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        if let card = try? context.fetch(request).first {
            context.delete(card)
            try? context.save()
        }
    }

    func card(forID id: String) -> SavedCard? {
        let request: NSFetchRequest<SavedCard> = SavedCard.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id)
        return try? context.fetch(request).first
    }
}

