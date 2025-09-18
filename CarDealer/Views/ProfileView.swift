//
//  ProfileView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//
// Profile View containing User information, Users listings, and users liked cars

import SwiftUI
import SwiftData

// User Profile Section
struct ProfileSection: View {
    let user: User
    
    var body: some View {
            LazyVStack {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 60, height: 60)
                    .overlay(Text(user.name().prefix(1)))
                Text(user.name())
                    .font(.headline)
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
    }
}

// User Listings Section
struct ListingSection: View {
    let listings: [Listing]
    
    var body: some View {
            if listings.isEmpty {
                Text("No Listings")
                    .foregroundColor(.secondary)
            } else {
                ForEach(listings) { listing in
                    NavigationLink(destination: CarListingView(listing: listing)) {
                        LazyVStack(alignment: .leading) {
                            Text("\(listing.car.brand) \(listing.car.model)")
                            Text("\(listing.price, specifier: "%.2f")")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
    }
}
// User Likes Section
struct LikesSection: View {
    let likes: [Like]
    
    var body: some View {
            if likes.isEmpty {
                Text("No cars liked")
                    .foregroundColor(.secondary)
            } else {
                ForEach(likes) { like in
                    NavigationLink(destination: CarListingView(car: like.car)) {
                        Text("\(like.car.brand) \(like.car.model) \(like.car.year)")
                    }
                }
            }
    }
}

struct ProfileView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject var session: Session
    
    @Query(filter: #Predicate<User> { $0.email == "test@example.com"})
     var users: [User]
    
    var body: some View {
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
