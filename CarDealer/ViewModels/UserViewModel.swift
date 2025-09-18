//
//  UserVM.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
//
// User View Model with functions to handle editing user elements

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
    
    func updateName() {
        
    }
    
    func updateImage() {
        
    }
    
}
