//
//  CarDealerApp.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//
// User and Car classes
// Session class

import SwiftUI
import SwiftData

@Model class User {
    @Attribute(.unique) var id: UUID = UUID()
    @Attribute(.unique) var username: String
    @Attribute(.unique) var email: String
    var fname: String
    var lname: String
    var avatarURL: String = "default_avatar"
    var passwordDigest: String
    
    func name() -> String {
        return "\(fname) \(lname)"
    }
    
    init(username: String, email: String, fname: String, lname: String, avatarURL: String, passwordDigest: String) {
        self.username = username
        self.email = email
        self.fname = fname
        self.lname = lname
        self.avatarURL = avatarURL
        self.passwordDigest = passwordDigest
    }
    
}

@Model class Car {
    @Attribute(.unique) var id: UUID = UUID()
    var brand: String
    var model: String
    var year: Int
    var price: Float
    var carURL: String = "default_car"
    var owner: User?
    
    func carName() -> String {
        return "\(year) \(brand) \(model)"
    }
    
    init(brand: String, model: String, year: Int, price: Float, carURL: String, owner: User? = nil) {
        self.brand = brand
        self.model = model
        self.year = year
        self.price = price
        self.carURL = carURL
        self.owner = owner
    }
    
}

class Session: ObservableObject {
    var currentUser: Bool?
    private let container: ModelContainer
    
    init(container: ModelContainer) {
        self.container = container
    }
}

struct RootView: View {
    @EnvironmentObject var session: Session
    
    var body: some View {
        if let _ = session.currentUser {
            ContentView()
        } else {
            LoginView()
        }
    }
}

@main
struct CarDealerApp: App {
    let container = try! ModelContainer(for: User.self, Car.self)
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.modelContext, ModelContext(container))
                .environmentObject(Session(container: container))
        }
        .modelContainer(container)
    }
}
