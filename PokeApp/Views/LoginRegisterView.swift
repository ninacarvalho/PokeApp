//
//  LoginRegisterView.swift
//  PokeApp
//
//  Created by Marina Carvalho on 2025-04-17.
//

import SwiftUI

struct LoginRegisterView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    @State private var email = ""
    @State private var password = ""
    @State private var isRegistering = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text(isRegistering ? "Register" : "Login")
                    .font(.largeTitle)
                    .bold()

                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)

                if let error = authViewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal)
                }

                Button(action: {
                    if isRegistering {
                        authViewModel.register(email: email, password: password)
                    } else {
                        authViewModel.login(email: email, password: password)
                    }
                }) {
                    Text(isRegistering ? "Register" : "Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Button(action: {
                    isRegistering.toggle()
                }) {
                    Text(isRegistering
                         ? "Already have an account? Log in"
                         : "Don't have an account? Register")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }

                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
        }
       
    }
}
