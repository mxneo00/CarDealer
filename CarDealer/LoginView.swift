//
//  LoginView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//
// Create a login page for users to enter username and password to log in
// Register a session for the current user

import Foundation
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: Session
    
    @State private var fname: String = ""
    @State private var lname: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var password_confirmation: String = ""
    @State private var isSignup = false
    @State private var error: String? = nil
    
    var body: some View {
        Form {
            TextField("Enter username", text: $username)
            TextField("Enter password", text: $password)
            TextField("Confirm password", text: $password_confirmation)
        }
        Button(action: login) {
            Text("Login")
        }
    }
    
    func login() {
        print("Logging in")
    }
}

#Preview {
    LoginView()
}
