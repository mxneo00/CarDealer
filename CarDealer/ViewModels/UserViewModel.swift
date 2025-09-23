//
//  UserVM.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
//
// User View Model with functions to handle editing user elements
// TODO: Add ability for user to update profile image


import SwiftUI
import SwiftData

class UserVM: ObservableObject {
    private var ctx: ModelContext
    @Published var user: User
    
    init(user: User, ctx: ModelContext) {
        self.user = user
        self.ctx = ctx
    }
    func updateEmail(email: String) {
        self.user.email = email
        saveContext()
    }
    
    func updateName(fname: String, lname: String) {
        self.user.fname = fname
        self.user.lname = lname
        saveContext()
    }
    
    func updateImage(avatarURL: String) {
        self.user.avatarURL = avatarURL
        saveContext()
    }
    
    private func saveContext() {
        do {
            try ctx.save()
        } catch {
            print("Error saving user changes.")
        }
    }
}
