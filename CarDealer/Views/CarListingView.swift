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
            // TODO: Make fully functioning
            Button("Create Listing") {
                vm.createListing(ctx: ctx, user: session.currentUser)
            }
        }
    }
}

struct CarDetailView: View {
    @EnvironmentObject var session: Session
    
    let listing: Listing?
    let car: Car?
    
    init(listing: Listing) {
        self.listing = listing
        self.car = nil
    }
    
    init(car: Car) {
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
    }
}

//#Preview {
//    let container = try! ModelContainer(for: User.self, Car.self, Listing.self, Like.self)
//    let context = ModelContext(container)
//    
//    CarListingView(listing: Listing)
//        .environmentObject(Session.preview)
//}
