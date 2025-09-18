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
            }
            Section("First Name") {
                TextField("First name", text: $fname)
            }
            Section("Last Name") {
                TextField("Last name", text: $lname)
            }
            Section("Email") {
                TextField("Email", text: $email)
                    .autocapitalization(.none)
            }
            Section("Password") {
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
            }
            Section("Confirm Password") {
                SecureField("Confirm password", text: $passwordConfirmation)
                    .autocapitalization(.none)
            }
        }
        Button("Sign Up") {
            do {
                try session.signup(email: email, lname: lname, fname: fname, password: password, username: username)
            } catch {
                print("Signup failed \(error)")
            }
        }
    }
    
//    func signup() {
//        let newUser = User(username: username, email: email, fname: fname, lname: lname, avatarURL: "globe", passwordDigest: password)
//        
//        guard !username.isEmpty, !email.isEmpty, !password.isEmpty else {
//            error = "Username, email, and password are required"
//            return
//        }
//        guard password == passwordConfirmation else {
//            error = "Passwords do not match"
//            return
//        }
//        //Create user in session
//        ctx.insert(newUser)
//        do {
//            try session.currentUser = newUser
//            print("Signup success")
//        } catch {
//            print("Signup failed: \(error)")
//        }
//    }
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
                }
                Section("Password") {
                    SecureField("Enter password", text: $password)
                        .autocapitalization(.none)
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
        guard !username.isEmpty, !password.isEmpty else {
            error = "Username and password required"
            return
        }
        // TODO Catch for username and password correct
        
        // TODO register user in session
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
