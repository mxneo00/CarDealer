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
    @Environment(\.modelContext) var ctx
    @EnvironmentObject var session: Session
//    @StateObject private var vm = LikesViewModel()
    
    let listing: Listing?
    let car: Car?
    
    init(listing: Listing) {
        self.listing = listing
        self.car = nil
        //_vm = StateObject(wrappedValue: LikesViewModel(ctx: ctx, user: User()))
    }
    
    init(car: Car) {
        self.listing = nil
        self.car = car
       //_vm = StateObject(wrappedValue: LikesViewModel(ctx: ctx, user: User()))
    }
    
    
    var body: some View {
        VStack {
            if let listing = listing {
                Text("Listing: \(listing.car.brand) \(listing.car.model) \(listing.car.year)")
            } else if let car = car {
                Text("Car: \(car.brand) \(car.model) \(car.year)")
            } else {
                Text("No data")
            }
//            if let car = car ?? listing?.car, let currentUser = session.currentUser {
//                Button(action: {
//                    try? vm.toggleLike(for: car)
//                }) {
//                    Image(systemName: vm.isLiked(car: car) ? "heart.fill" : "heart")
//                        .foregroundColor(.red)
//                }
//            }
        }
//        .onAppear {
//            if let currentUser = session.currentUser {
//                vm.ctx = ctx
//                vm.user = currentUser
//                vm.getLikes()
//            }
//        }
    }
}
