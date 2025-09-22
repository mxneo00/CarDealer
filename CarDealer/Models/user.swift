//
//  car.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
//

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
    var accountActivated: Bool = false
    var createdAt: Double = Date().timeIntervalSince1970
    var updatedAt: Double = Date().timeIntervalSince1970
    
    @Relationship(deleteRule: .cascade) var listings: [Listing] = []
    @Relationship(deleteRule: .cascade) var likes: [Like] = []
    //@Relationship(deleteRule: .nullify) var orders: [Order]
    
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
