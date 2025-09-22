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
                ThemedBackground {
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
            }
            .tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }
        }
    }
}


//#Preview {
//    let container = try! ModelContainer(for: User.self, Car.self, Listing.self, Like.self)
//    let context = ModelContext(container)
//    
//    ProfileView()
//        .environmentObject(Session.preview)
//}
