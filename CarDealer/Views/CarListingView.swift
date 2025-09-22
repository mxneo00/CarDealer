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
        VStack {
            StyledSection(title: "Brand") {
                TextField("Brand", text: $vm.brand)
                    .formFieldStyle()
            }
            StyledSection(title: "Model") {
                TextField("Model", text: $vm.model)
                    .formFieldStyle()
            }
            StyledSection(title: "Year") {
                TextField("Year", text: $vm.yearInput)
                    .formFieldStyle()
                    .keyboardType(.numberPad)
            }
            StyledSection(title: "Price") {
                TextField("Price", text: $vm.priceInput)
                    .formFieldStyle()
                    .keyboardType(.numberPad)
            }
            Button("Create Listing") {
                vm.createListing(ctx: ctx, user: session.currentUser)
            }.buttonStyle(PillButtonStyle())
        }.formStyle().padding(.horizontal)
    }
}

struct CarDetailView: View {
    @ObservedObject var CVM: CarViewModel
    
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
                        Text(CVM.car.owner.name)
                    }
                }.padding()
                Text("\(CVM.car.price)")
//                NavigationLink(desination: OrderView(CVM: CVM)) {
//                    Text("Place Order")
//                }.buttonStyle(PillButtonStyle())
//                Spacer()
            }
        }
    }
}
