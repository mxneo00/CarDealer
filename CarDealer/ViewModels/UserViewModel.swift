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
    // Thread 1: Fatal error: No ObservableObject of type Session found. A View.environmentObject(_:) for Session may be missing as an ancestor of this view.
    func updateEmail(email: String) {
//        if let user = session.currentUser {
//            user.email = email
//        } else {
//            print("Error: Failed to find user")
//        }
        self.user.email = email
        
        do {
            try ctx.save()
        } catch {
            print("Error updating email")
        }
    }
    
    func updateName(fname: String, lname: String) {
//        if let user = session.currentUser {
//            user.fname = fname
//            user.lname = lname
//        } else {
//            print("Failed to find user")
//        }
        self.user.fname = fname
        self.user.lname = lname
        
        do {
            // Purple Warning? Accessing Environment<ModelContext>'s value outside of being installed on a View. This will always read the default value and will not update. (But the last name updated properly)
            try ctx.save()
        } catch {
            print("Error updating name")
        }
    }
    
    func updateImage(avatarURL: String) {
//        if let user = session.currentUser {
//            user.avatarURL = avatarURL
//        } else {
//            print("Failed to find user")
//        }
        self.user.avatarURL = avatarURL
        
        do {
            try ctx.save()
        } catch {
            print("Error updating profile image")
        }
    }
    
}
