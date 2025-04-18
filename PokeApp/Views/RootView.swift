//
//  RootView.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        if authViewModel.isLoggedIn {
            MainTabView()
        } else {
            LoginRegisterView()
        }
    }
}
