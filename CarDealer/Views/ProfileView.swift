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
//        Section(header: Text("Profile")) {
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
//        }
    }
}

// User Listings Section
struct ListingSection: View {
    let listings: [Listing]
    
    var body: some View {
//        Section(header: Text("My Listings")) {
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
//        }
    }
}
// User Likes Section
struct LikesSection: View {
    let likes: [Like]
    
    var body: some View {
//        Section(header: Text("Liked Cars")) {
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
//        }
    }
}

struct ProfileView: View {
    @Environment(\.modelContext) private var context
    
    // TODO: Set up to handle an actual signed-in user session
    @Query(filter: #Predicate<User> { $0.email == "test@example.com"})
     var users: [User]
    
    var body: some View {
        NavigationStack {
            if let user = users.first {
                List {
                    Section(header: Text("Profile")) {
                        ProfileSection(user: user)
                    }
                    Section(header: Text("Listings")) {
                        ListingSection(listings: user.listings)
                    }
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
    
//    let car1 = Car(brand: "Toyota", model: "Corolla", year: 2022, price: 22000, carURL: "globe")
//    let car2 = Car(brand: "Ford", model: "Mustang", year: 2023, price: 45000, carURL: "globe")
//    
//    let dummyUser = User(username: "DoeJohn", email: "djohn@yahoo.com", fname: "John", lname: "Doe", avatarURL: "globe", passwordDigest: "Password")
//    //context.insert(dummyUser)
//    
//    let listing1 = Listing(id: UUID(), price: 21000, car: car1, seller: dummyUser, isSold: false)
//    let listing2 = Listing(id: UUID(), price: 40000, car: car2, seller: dummyUser, isSold: true)
//    let like1 = Like(id: UUID(), user: dummyUser, car: car1)
//    
//    let session = Session(container: container)
//    session.currentUser = dummyUser
    
    ProfileView()
        .environmentObject(Session.preview)
//        .environmentObject(session)
//        .environment(\.modelContext, ModelContext(container))
}
