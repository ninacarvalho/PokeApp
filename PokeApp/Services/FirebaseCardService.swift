//
//  FirebaseCardService.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import FirebaseFirestore
import FirebaseAuth

class FirebaseCardService {
    static let shared = FirebaseCardService()
    private let db = Firestore.firestore()

    func saveCard(card: PokemonCard, status: CardStatus, flag: EvolutionFlag) {
        guard let userID = Auth.auth().currentUser?.uid else { return }

        let data: [String: Any] = [
            "id": card.id,
            "name": card.name,
            "imageURL": card.images.small,
            "cardStatus": status.rawValue,
            "evolutionFlag": flag.rawValue,
            "timestamp": FieldValue.serverTimestamp()
        ]

        db.collection("users")
            .document(userID)
            .collection("savedCards")
            .document(card.id)
            .setData(data) { error in
                if let error = error {
                    print("❌ Firestore save failed: \(error)")
                } else {
                    print("✅ Saved card \(card.name) to Firestore!")
                }
            }
    }
}
