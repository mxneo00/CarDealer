//
//  LoginView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//
// Sign up page for new users to create an account
// Create a login page for users to enter username and password to log in

import Foundation
import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var session: Session
    
    @State private var fname: String = ""
    @State private var lname: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirmation: String = ""
    @State private var error: String? = nil
    
    var body: some View {
        Form {
            Section("Username") {
                TextField("Enter username", text: $username)
            }
            Section("First Name") {
                TextField("First name", text: $fname)
            }
            Section("Last Name") {
                TextField("Last name", text: $lname)
            }
            Section("Email") {
                TextField("Email", text: $email)
            }
            Section("Password") {
                TextField("Password", text: $password)
            }
            Section("Confirm Password") {
                TextField("Confirm password", text: $passwordConfirmation)
            }
        }
        Button(action: signUp) {
            Text("Sign Up")
        }
    }
    func signUp() {
        print("Signed up")
    }
}

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
        NavigationStack {
            Form {
                Section("Username") {
                    TextField("Enter username", text: $username)
                }
                Section("Password") {
                    TextField("Enter password", text: $password)
                }
                Button(action: login) {
                    Text("Login")
                }
            }
            Section("New User") {
                NavigationLink("Sign Up", destination: SignUpView())
            }
            
        }
    }
    
    func login() {
        print("Logging in")
    }
}

#Preview {
    LoginView()
    //SignUpView()
}
