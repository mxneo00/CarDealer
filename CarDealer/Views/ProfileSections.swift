//
//  ProfileSections.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
//
// Profile View Sections

import SwiftUI
import SwiftData

// User Profile Section
struct ProfileSection: View {
    let user: User
    
    var body: some View {
            VStack {
                // Old
                //Circle()
                //    .fill(Color.gray.opacity(0.3))
                //    .frame(width: 60, height: 60)
                //    .overlay(Text(user.name().prefix(1)))
                //Text(user.name())
                //    .font(.headline)
                //Text(user.email)
                //    .font(.subheadline)
                //    .foregroundColor(.secondary)

                // Redesigned
                Image(session.currentUser!.avatarURL)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.blue, lineWidth: 6))
                    .padding(20)

                ZStack {
                    Rectangle()
                        .fill(.white)
                        .ignoreSafeArea(edges: .all)
                    VStack(alignment: .leading) {
                        StyledSection(title: "Name") {
                            if let user = session.currentUser {
                                Text(user.name())
                            } else {
                                Text("No name")
                            }
                        }
                        Spacer()
                        StyledSection(title: "Email") {
                            Text(session.currentUser!.email)
                        }
                        Spacer()
                    }.padding(48)
                }
            }
    }
}

// User Listings Section
// ??? 
struct ListingSection: View {
    let listings: [Listing]
    
    var body: some View {
            if listings.isEmpty {
                Text("No Listings")
                    .foregroundColor(.secondary)
            } else {
                ForEach(listings) { listing in
                    NavigationLink(destination: CarDetailView(listing: listing)) {
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
// ???
struct LikesSection: View {
    let likes: [Like]
    
    var body: some View {
            if likes.isEmpty {
                Text("No cars liked")
                    .foregroundColor(.secondary)
            } else {
                ForEach(likes) { like in
                    NavigationLink(destination: CarDetailView(car: like.car)) {
                        Text("\(like.car.brand) \(like.car.model) \(like.car.year)")
                    }
                }
            }
    }
}
