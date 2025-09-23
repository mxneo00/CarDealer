//
//  OrderView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/22/25.
//

import SwiftUI
import SwiftData

struct OrderView: View {
    @ObservedObject var carVM: CarViewModel
    @State private var orderPrice: String
    
    init(carVM: CarViewModel) {
        self.carVM = carVM
        _orderPrice = State(initialValue: String(carVM.car.price))
    }
    
    var body: some View {
        VStack {
            Text("Confirm Purchase")
                .font(.headline)
            StyledSection(title: "Price") {
                TextField("Price", text: $orderPrice)
                    .keyboardType(.decimalPad)
            }
            Button(action: placeOrder) {
                Text("Place Order")
            }.buttonStyle(PillButtonStyle())
        }.formStyle()
    }
    
    private func placeOrder() {
        if let price = Double(orderPrice) {
            print("Placing order for \(carVM.car.brand) \(carVM.car.model) at $\(price)")
        } else {
            print("Invalid price input: \(orderPrice)")
        }
    }
}

struct OrdersView: View {
    @EnvironmentObject var session: Session
    @Environment(\.modelContext) var ctx
    
    var body: some View {
        NavigationStack {
            ThemedBackground {
                VStack {
                    if let user = session.currentUser {
                        NavigationStack {
                            if user.listings.isEmpty {
                                Text("No Listings")
                            } else {
                                ListingView(listings: user.listings)
                                    .navigationTitle("Listings")
                            }
                        }
                    }
                    NavigationLink(destination: SellView()) {
                        Text("Sell Car")
                    }.buttonStyle(PillButtonStyle())
                    Spacer()
                }.padding()
            }//.ignoresSafeArea() // Messes with the Listings
        }
    }
}

struct ListingView: View {
    let listings: [Listing]
    
    var body: some View {
        if listings.isEmpty {
            Text("No Listings")
                .foregroundColor(.white)
        } else {
            ForEach(listings) { listing in
                NavigationLink(destination: ListingDetailView(listing: listing)) {
                    LazyVStack(alignment: .leading) {
                        Text("\(listing.car.carName())")
                        Text("$\(listing.price, specifier: "%.2f")")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}
