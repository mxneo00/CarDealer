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
    
    @State private var brand: String = ""
    @State private var model: String = ""
    @State private var yearInput: String = ""
    @State private var year: Int?
    @State private var priceInput: String = ""
    @State private var price: Float?
    @State private var imageURL: String = ""
    
    var body: some View {
        Form {
            Section("Brand") {
                TextField("Brand", text: $brand)
            }
            Section("Model") {
                TextField("Model", text: $model)
            }
            Section("Year") {
                TextField("Year", text: $yearInput)
                    .keyboardType(.numberPad)
                    .onChange(of: yearInput) { newValue in
                        year = Int(newValue) ?? 0
                    }
            }
            Section("Price") {
                TextField("Price", text: $priceInput)
                    .keyboardType(.numberPad)
                    .onChange(of: priceInput) { newValue in
                            price = Float(newValue) ?? 0
                    }
            }
            // TODO: Make fully functioning
            Button("Create Listing") {
                print("Listing created")
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
