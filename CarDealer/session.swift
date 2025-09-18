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
        let newUser = User(username: username, email: email, fname: fname, lname: lname, avatarURL: "globe", passwordDigest: digest)
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

extension ModelContainer {
    static var preview: ModelContainer {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        return try! ModelContainer(for: User.self, Car.self, Listing.self, Like.self, configurations: config)
    }
}

class MockSession: Session {
    override init(container: ModelContainer) {
        super.init(container: container)
        self.currentUser = previewUser
    }
    
    var user2: User {
        return User(username: "DoeJane", email: "dhjane@yahoo.com", fname: "Jane", lname: "Doe", avatarURL: "globe", passwordDigest: "Password")
    }
    
    var previewUser: User {
        let car1 = Car(brand: "Toyota", model: "Corolla", year: 2022, price: 22000, carURL: "globe")
        let car2 = Car(brand: "Ford", model: "Mustang", year: 2023, price: 45000, carURL: "globe")
        
        _ = Listing(price: 21000, car: car1, seller: user2)
        _ = Listing(price: 40000, car: car2, seller: user2)
        _ = Like(id: UUID(), user: user2, car: car1)
        
        return User(username: "DoeJohn", email: "djohn@yahoo.com", fname: "John", lname: "Doe", avatarURL: "globe", passwordDigest: "Password")
    }
    
    override func login(emailOrUsername: String, password: String) throws {
        self.currentUser = previewUser
    }
    
    override func signup(email: String, lname: String, fname: String, password: String, username: String) throws {
        // no-op
    }
}

extension Session {
    static var preview: Session {
        MockSession(container: ModelContainer.preview)
    }
}

enum LoginError: Error {
    case invalidCredentials
}
