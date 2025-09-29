//
//  mock.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/22/25.
//

import SwiftUI
import SwiftData

extension ModelContainer {
    static var preview: ModelContainer {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        return try! ModelContainer(for: User.self, Car.self, Listing.self, Like.self, configurations: config)
    }
}

extension User {
    static var preview: User = User(
        username: "John", email: "Doe", fname: "example", lname: "jdoe@example.com", avatarURL: "default_avatar", passwordDigest: "lk32jlk32jelk23je"
    )
}

class MockSession: Session {
    override init(container: ModelContainer) {
        super.init(container: container)
        self.currentUser = User.preview
    }
    
    override func login(emailOrUsername: String, password: String) throws {
        self.currentUser = User.preview
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
