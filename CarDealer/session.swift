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
        let user = User(username: username, email: email, fname: fname, lname: lname, avatarURL: "globe", passwordDigest: digest)
        
        ctx.insert(user)
        try ctx.save()
        
        currentUser = user
    }
    
    func login(emailOrUsername: String, password: String) throws {
        let digest = hash(password: password)
        
        let descriptor = FetchDescriptor<User>(
            predicate: #Predicate{$0.email == emailOrUsername || $0.username == emailOrUsername && $0.passwordDigest == digest }
        )
        
        let users = try ctx.fetch(descriptor)
        
        if let user = users.first {
            currentUser = user
        } else {
            throw LoginError.invalidCredentials
        }
    }
    
    func logout() {
        currentUser = nil
    }
}

enum LoginError: Error {
    case invalidCredentials
}
