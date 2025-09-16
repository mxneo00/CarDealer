//
//  CarListingView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//

import SwiftUI
import SwiftData

struct CarListingView: View {
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
//    let container = try! ModelContainer(for: User.self, Car.self, Listing.self)
//    let context = ModelContext(container)
//    
//    let dummyUser = User(username: "DoeJohn", email: "djohn@yahoo.com", fname: "John", lname: "Doe", avatarURL: "globe", passwordDigest: "Password")
//    context.insert(dummyUser)
//    
//    let dummyCar = Car(brand: "Honda", model: "Civic", year: 2023, price: 22000, carURL: "globe")
//    
//    let dummyListing = Listing(id: UUID(), price: 22000, car: dummyCar, seller: dummyUser, isSold: false)
//    
//    context.insert(dummyListing)
//    
//    CarListingView(listing: dummyListing)
//        .environment(\.modelContext, context)
//}
