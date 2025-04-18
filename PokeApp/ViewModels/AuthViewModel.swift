//
//  AuthViewModel.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import Foundation
import FirebaseAuth
import Combine

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String?
    
    @Published var currentUserEmail: String?
    @Published var currentUserUID: String?


    private var handle: AuthStateDidChangeListenerHandle?

    init() {
        listenToAuthState()
    }

    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }

    private func listenToAuthState() {
        handle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.isLoggedIn = (user != nil)
            self?.currentUserEmail = user?.email
            self?.currentUserUID = user?.uid
        }
    }


    func register(email: String, password: String) {
        errorMessage = nil
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            } else {
                self?.isLoggedIn = true
            }
        }
    }

    func login(email: String, password: String) {
        errorMessage = nil
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            } else {
                self?.isLoggedIn = true
            }
        }
    }

    func logout() {
        do {
            try Auth.auth().signOut()
            self.isLoggedIn = false
            self.currentUserEmail = nil
            self.currentUserUID = nil
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }

}
