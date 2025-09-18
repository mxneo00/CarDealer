//
//  CarListingView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
// View Specific car listing data
// Create Sell Tab View (Users create new car listings)

import SwiftUI
import SwiftData

struct SellTabView: View {
    @EnvironmentObject var session: Session
    @Environment(\.modelContext) var ctx
    @StateObject private var vm = SellTabViewModel()
    
    var body: some View {
        Form {
            Section("Brand") {
                TextField("Brand", text: $vm.brand)
            }
            Section("Model") {
                TextField("Model", text: $vm.model)
            }
            Section("Year") {
                TextField("Year", text: $vm.yearInput)
                    .keyboardType(.numberPad)
            }
            Section("Price") {
                TextField("Price", text: $vm.priceInput)
                    .keyboardType(.numberPad)
            }
            Button("Create Listing") {
                vm.createListing(ctx: ctx, user: session.currentUser)
            }.buttonStyle(PillButtonStyle())
        }
    }
}

struct CarDetailView: View {
    @EnvironmentObject var session: Session
    @StateObject private var vm: LikesViewModel
    
    let listing: Listing?
    let car: Car?
    
    init(listing: Listing, user: User) {
        self.listing = listing
        self.car = nil
    }
    
    init(car: Car, user: User) {
        self.listing = nil
        self.car = car
    }
    
    
    var body: some View {
        if let listing = listing {
            Text("Listing: \(listing.car.brand) \(listing.car.model) \(listing.car.year)")
        } else if let car = car {
            Text("Car: \(car.brand) \(car.model) \(car.year)")
        } else {
            Text("No data")
        }
        Button(action: {
            try? vm.toggleLike(for: car!)
        }) {
            Image(systemName: vm.isLiked(car: car!) ? "heart.fill" : "heart")
                .foregroundColor(.red)
        }
    }
}

//#Preview {
//    let container = try! ModelContainer(for: User.self, Car.self, Listing.self, Like.self)
//    let context = ModelContext(container)
//    
//    CarListingView(listing: Listing)
//        .environmentObject(Session.preview)
//}
