//
//  FirestoreCardFetcher.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import FirebaseFirestore
import FirebaseAuth

class FirestoreCardFetcher {
    static let shared = FirestoreCardFetcher()
    private let db = Firestore.firestore()

    func fetchSavedCards(completion: @escaping ([SavedCardItem]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            completion([])
            return
        }

        db.collection("users")
            .document(uid)
            .collection("savedCards")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("❌ Firestore fetch failed: \(error)")
                    completion([])
                    return
                }

                let cards = snapshot?.documents.compactMap { doc -> SavedCardItem? in
                    let data = doc.data()
                    guard
                        let id = data["id"] as? String,
                        let name = data["name"] as? String,
                        let imageURL = data["imageURL"] as? String,
                        let cardStatus = data["cardStatus"] as? String,
                        let evolutionFlag = data["evolutionFlag"] as? String
                    else {
                        return nil
                    }

                    return SavedCardItem(
                        id: id,
                        name: name,
                        imageURL: imageURL,
                        cardStatus: CardStatus(rawValue: cardStatus) ?? .none,
                        evolutionFlag: EvolutionFlag(rawValue: evolutionFlag) ?? .none
                    )
                } ?? []

                completion(cards)
            }
    }
}
