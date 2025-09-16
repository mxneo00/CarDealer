//
//  ProfileView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    @Environment(\.modelContext) private var context
    
    // TODO: Set up to handle an actual signed-in user session
    @Query(filter: #Predicate<User> { $0.email == "test@example.com"})
    private var users: [User]
    
    var body: some View {
        NavigationStack {
            if let user = users.first {
                List {
                    // Profile Section
                    Section(header: Text("Profile")) {
                        HStack {
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 60, height: 60)
                                .overlay(Text(user.name().prefix(1)))
                            
                            VStack(alignment: .leading) {
                                Text(user.name())
                                    .font(.headline)
                                Text(user.email)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    // User Listings Section
                    Section(header: Text("My Listings")) {
                        if user.listings.isEmpty {
                            Text("No Listings")
                                .foregroundColor(.secondary)
                        } else {
                            ForEach(user.listings) { listing in
                                NavigationLink(destination: CarListingView(listing: listing)) {
                                    VStack(alignment: .leading) {
                                        Text("\(listing.car.brand) \(listing.car.model)")
                                        Text("\(listing.price, specifier: "%0.2f")")
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                    }
                    // User Likes Section
                    Section(header: Text("Liked Cars")) {
                        if user.likes.isEmpty {
                            Text("No cars liked")
                                .foregroundColor(.secondary)
                        } else {
                            ForEach(user.likes) { like in
                                NavigationLink(destination: CarListingView(car: like.car)) {
                                    Text("\(like.car.brand) \(like.car.model) \(like.car.year)")
                                }
                            }
                        }
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
                }
                .navigationTitle("Profile")
            } else {
                Text("No user signed in")
            }
        }
    }
}

#Preview {
    ProfileView()
}
