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
    @EnvironmentObject var session: Session
    @Environment(\.modelContext) var ctx: ModelContext
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func updateEmail(email: String) {
        if let user = session.currentUser {
            user.email = email
        } else {
            print("Error: Failed to find user")
        }
        
        do {
            try ctx.save()
        } catch {
            print("Error updating email")
        }
    }
    
    func updateName(fname: String, lname: String) {
        if let user = session.currentUser {
            user.fname = fname
            user.lname = lname
        } else {
            print("Failed to find user")
        }
        
        do {
            try ctx.save()
        } catch {
            print("Error updating name")
        }
    }
    
//    func updateImage() {
//        
//    }
    
}
