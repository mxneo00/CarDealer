//
//  session.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/15/25.
//
// Session registration

import SwiftUI
import SwiftData
import CryptoKit

class Session: ObservableObject {
    @Published var currentUser: User?
    private let container: ModelContainer
    private let ctx: ModelContext
    
    init(container: ModelContainer) {
        self.currentUser = nil
        self.container = container
        self.ctx = ModelContext(container)
    }
    
    // Hash password
    func hash(password: String) -> String {
        let data = Data(password.utf8)
        let hashed = SHA256.hash(data: data)
        return hashed.compactMap{ String(format: "%02x", $0)}.joined()
    }
    
    func signup(email: String, lname: String, fname: String, password: String, username: String) throws {
        let digest = hash(password: password)
        let newUser = User(username: username, email: email, fname: fname, lname: lname, passwordDigest: digest)
        //TODO Fix
//        guard !username.isEmpty, !email.isEmpty, !password.isEmpty else {
//            error = "Username, email, and password are required"
//            return
//        }
//        guard password == passwordConfirmation else {
//            error = "Passwords do not match"
//            return
//        }
        
        ctx.insert(newUser)
        do {
            try ctx.save()
            currentUser = newUser
        } catch {
            print("Signup failed: \(error)")
        }
    }
    
    func login(emailOrUsername: String, password: String) throws {
        let digest = hash(password: password)
        
        let descriptor = FetchDescriptor<User>(
            predicate: #Predicate{$0.email == emailOrUsername || $0.username == emailOrUsername && $0.passwordDigest == digest }
        )
        
        if let user = try? ctx.fetch(descriptor).first {
            self.currentUser = user
        } else {
            throw LoginError.invalidCredentials
        }
        
    }
    
    func logout() {
        self.currentUser = nil
    }
}

enum LoginError: Error {
    case invalidCredentials
}
