//
//  CarDetailView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
// View Specific Car Details
// Also includes car listing view for vehicles users add

import SwiftUI
import SwiftData

struct CarDetailView: View {
    @ObservedObject var carVM: CarViewModel
    
    var body: some View {
        ThemedBackground {
            VStack {
                Image(systemName: "car.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .clipped()
                VStack {
                    HStack {
                        Image("default_avatar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.blue, lineWidth: 4))
                        Text(carVM.car.owner!.name())
                    }
                }.padding()
                VStack {
                    Text("\(carVM.car.year, format: .number.grouping(.never)) \(carVM.car.brand) \(carVM.car.model)")
                    Text("\(carVM.car.price, specifier: "%.2f")")
                }
                //TODO: Implement OrderView Properly
//                NavigationLink(desination: OrderView(carVM: carVM)) {
//                    Text("Purchase Car")
//                }.buttonStyle(PillButtonStyle())
//                Spacer()
            }
        }
    }
}

// Add ability to edit or delete listings
struct ListingDetailView: View {
    @EnvironmentObject var session: Session
    
    let listing: Listing?
    
    init(listing: Listing?) {
        self.listing = listing
    }
    
    var body: some View {
        ThemedBackground {
            if let listing = listing {
                VStack {
                    Text("Listing: \(listing.car.year) \(listing.car.brand) \(listing.car.model)")
                    Text("Price: \(listing.car.price) \(listing.car.miles)")
                }
            } else {
                Text("No Listings Yet")
            }
        }.ignoresSafeArea()
    }
    
}
