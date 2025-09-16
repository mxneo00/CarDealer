//
//  session.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/15/25.
//
// Session registration

import SwiftUI
import SwiftData

class Session: ObservableObject {
    @Published var currentUser: Bool?
    private let container: ModelContainer
    private let ctx: ModelContext
    
    init(container: ModelContainer) {
        self.currentUser = nil
        self.container = container
        self.ctx = ModelContext(container)
    }
    
    func hash(password: String) -> String {
        return password
    }
    
    func signup(email: String, lname: String, fname: String, password: String, username: String) throws {
        let c = ctx
        let digest = hash(password: password)
        let user = User(username: username, email: email, fname: fname, lname: fname, avatarURL: "globe", passwordDigest: digest)
        
        c.insert(user)
        try c.save()
        currentUser = true
    }
    
    func login(emailOrUsername: String, password: String) {
        let digest = hash(password: password)
        if emailOrUsername == "USERNAME" && password == "PASSWORD" {
            currentUser = true
        } else {
            print("Username or password not recognized")
        }
    }
}
