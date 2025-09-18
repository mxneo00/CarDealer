//
//  SignInView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//
// Sign up page for new users to create an account
// Create a login page for users to enter username and password to log in

import SwiftUI
import SwiftData

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
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
            }
            Section("First Name") {
                TextField("First name", text: $fname)
                    .autocorrectionDisabled(true)
            }
            Section("Last Name") {
                TextField("Last name", text: $lname)
                    .autocorrectionDisabled(true)
            }
            Section("Email") {
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
            }
            Section("Password") {
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
            }
            Section("Confirm Password") {
                SecureField("Confirm password", text: $passwordConfirmation)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
            }
        }
        Button("Sign Up") {
            // Create session on signup completion
            do {
                try session.signup(email: email, lname: lname, fname: fname, password: password, username: username)
            } catch {
                print("Signup failed \(error)")
            }
        }
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
                        .autocapitalization(.none)
                        .autocorrectionDisabled(true)
                }
                Section("Password") {
                    SecureField("Enter password", text: $password)
                        .autocapitalization(.none)
                        .autocorrectionDisabled(true)
                }
                Button(action: login) {
                    Text("Login")
                }
                Section("New User") {
                    NavigationLink("Sign Up", destination: SignUpView())
                }
            }
            
        }
    }
    
    func login() {
        // Check if Username or Password Fields are empty
        guard !username.isEmpty, !password.isEmpty else {
            error = "Username and password required"
            return
        }
        // TODO Catch for username and password correct
        
        // Start session on login
        do {
            try session.login(emailOrUsername: username, password: password)
        } catch {
            print("Login failed: \(error)")
        }
        if let user = session.currentUser {
            print("Logged in as \(user.username)")
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: User.self, Car.self)
    let session = Session(container: container)
    LoginView()
        .environmentObject(session)
        .environment(\.modelContext, ModelContext(container))
//    SignUpView()
//        .environmentObject(session)
//        .environment(\.modelContext, ModelContext(container))
    
}
