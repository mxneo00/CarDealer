//
//  ProfileSections.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
//
// Profile View Sections

import SwiftUI
import SwiftData

// User Listings Section
// ??? 
struct ListingSection: View {
    let carVM: CarViewModel
    let listings: [Listing]
    
    var body: some View {
            if listings.isEmpty {
                Text("No Listings")
                    .foregroundColor(.secondary)
            } else {
                ForEach(listings) { listing in
                    NavigationLink(destination: CarDetailView(carVM: carVM)) {
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
    let carVM: CarViewModel
    let likes: [Like]
    
    var body: some View {
            if likes.isEmpty {
                Text("No cars liked")
                    .foregroundColor(.secondary)
            } else {
                ForEach(likes) { like in
                    NavigationLink(destination: CarDetailView(carVM: carVM)) {
                        Text("\(like.car.brand) \(like.car.model) \(like.car.year)")
                    }
                }
            }
    }
}
