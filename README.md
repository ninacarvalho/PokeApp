# PokeApp

A modern iOS app built using **SwiftUI**, **Firebase**, and **Core Data** to fetch, display, and save Pokémon Trading Card Game cards. This app combines remote data fetching from the Pokémon TCG API with offline storage and Firebase cloud sync, allowing users to build and manage their personal Pokémon card collection.

---

## Features

- Browse Pokémon cards from the [Pokémon TCG API](https://pokemontcg.io/)
- Save cards locally using Core Data
- Sync cards to Firestore under your authenticated Firebase user
- Add flags: Card Status (`Want`, `Have`) and Evolution Intent (`Needs Evolution`, `Final Evolution`)
- Firebase Authentication

---

## Technologies Used

- **SwiftUI** – Modern UI framework by Apple
- **Firebase** – Auth & Firestore for cloud sync
- **Core Data** – Local persistence
- **Pokémon TCG API** – Public REST API for Pokémon card data
- **MVVM Architecture** – Clean and testable code separation

---

## Project Structure

```
PokeApp/
│
├── Models/               # Codable structs for Card, Flags, etc.
├── Services/             # API calls to TCG + Firebase interaction
├── CoreData/             # Local save/load logic
├── Views/                # SwiftUI views (not shown in this doc)
├── PokeAppApp.swift      # App entry point + Firebase config
└── Assets/               # Icons, colors, etc.
```

---

## Firebase Setup

1. Create a Firebase project and enable **Authentication** (email/password)
2. Add **Cloud Firestore**
3. Download `GoogleService-Info.plist` and place it in `PokeApp/`
4. Configure Firestore rules if needed

---

## 📡 API Usage

```swift
let cards = try await PokeTCGService.shared.fetchCards(page: 1)
```

---

## Local & Cloud Storage

Cards can be saved either:
- **Locally** using `CardStorageManager` (Core Data)
- **To Cloud** using `FirebaseCardService` (Firestore)

---


## ✍Author

**Marina Carvalho**  
[LinkedIn](https://www.linkedin.com/in/marina-carv)

---

## License

This project is for educational and portfolio purposes.
