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
        TabView {
            NavigationStack {
                if let user = session.currentUser {
                    VStack(spacing: 20) {
                        ProfileSection(user: user)
                        
                        HStack {
                            NavigationLink("Edit Profile") {
                                EditProfileView()
                            }
                            Spacer()
                            Button("Logout") {
                                session.logout()
                            }.buttonStyle(PillButtonStyle())
                        }
                        .padding(.horizontal)
                    }
                    .padding()
                    .navigationTitle("Profile")
                } else {
                    Text("No user signed in")
                        .navigationTitle("Profile")
                }
            }
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }
            
            if let user = session.currentUser {
                NavigationStack {
                    ListingSection(listings: user.listings)
                        .navigationTitle("Listings")
                }
                .tabItem {
                    Label("Listings", systemImage: "car.fill")
                }
                
                NavigationStack {
                    LikesSection(likes: user.likes)
                        .navigationTitle("Likes")
                }
                .tabItem {
                    Label("Likes", systemImage: "heart.fill")
                }
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
