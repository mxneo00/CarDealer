//
//  ProfileView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//
// Profile View containing User information, Users listings, and users liked cars
// Edit Profile View

import SwiftUI
import SwiftData

struct EditProfileView: View {
    var body: some View {
        Text("Edit profile")
    }
}

struct ProfileView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var session: Session
    
    @Query(filter: #Predicate<User> { $0.email == "test@example.com"})
     var users: [User]
    
    var body: some View {
        // Change so that the initial view is just the profile section
        // Make Listings and Likes into tabs and add a tab to go back to home page
        NavigationStack {
            if let user = session.currentUser {
                List {
                    Section(header: Text("Profile")) {
                        ProfileSection(user: user)
                    }
                    Section(header: Text("Listings")) {
                        ListingSection(listings: user.listings)
                    }
                    // TODO Create new Listing Button
//                    Section() {
//                        Button("New Listing"){
//
//                        }
//                    }
                    Section(header: Text("Likes")) {
                        LikesSection(likes: user.likes)
                    }
// TODO: Set up buttons to navigate to edit and log out
//                    Section() {
//                        Button("Edit Profile") {
//
//                        }
//                        Button("Log out") {
//
//                        }
//                    }
                    // OPTIONAL ADDITION Settings (manage edit profile and logout here
                    
                }
                .navigationTitle("Profile")
            } else {
                VStack {
                    Text("No user signed in")
                }
                .navigationTitle("Profile")
            }
        }
    }
}


#Preview {
    let container = try! ModelContainer(for: User.self, Car.self, Listing.self, Like.self)
    let context = ModelContext(container)
    
    ProfileView()
        .environmentObject(Session.preview)
}
