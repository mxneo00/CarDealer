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
        ThemedBackground {
            VStack {
                StyledSection(title: "Username") {
                    TextField("Enter username", text: $username)
                        .formFieldStyle()
                }
                StyledSection(title: "First Name") {
                    TextField("First name", text: $fname)
                        .formFieldStyle()
                }
                StyledSection(title: "Last Name") {
                    TextField("Last name", text: $lname)
                        .formFieldStyle()
                }
                StyledSection(title: "Email") {
                    TextField("Email", text: $email)
                        .formFieldStyle()
                }
                StyledSection(title: "Password") {
                    SecureField("Password", text: $password)
                        .formFieldStyle()
                }
                StyledSection(title: "Confirm Password") {
                    SecureField("Confirm password", text: $passwordConfirmation)
                        .formFieldStyle()

                }
                Button("Sign Up") {
                    do {
                        try session.signup(email: email, lname: lname, fname: fname, password: password, username: username)
                    } catch {
                        print("Signup failed \(error)")
                    }
                }.buttonStyle(PillButtonStyle())
            }.formStyle().padding(.horizontal)
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
            ThemedBackground {
                VStack(spacing: 24) {
                    StyledSection(title: "Username") {
                        TextField("Enter username", text: $username)
                            .formFieldStyle()
                            .autocapitalization(.none)
                            .autocorrectionDisabled(true)
                    }
                    StyledSection(title: "Password") {
                        SecureField("Enter password", text: $password)
                            .formFieldStyle()
                            .autocapitalization(.none)
                            .autocorrectionDisabled(true)
                    }
                    Button(action: login) {
                        Text("Login")
                    }.buttonStyle(PillButtonStyle())
                    StyledSection(title: "New User?") {
                        NavigationLink("Sign Up", destination: SignUpView())
                    }
                }.formStyle().padding(.horizontal)
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
    
}
