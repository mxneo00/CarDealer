//
//  CarListingView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
// View Specific car listing data
// Create Sell Tab View (Users create new car listings)

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
//                NavigationLink(desination: OrderView(carVM: carVM)) {
//                    Text("Purchase Car")
//                }.buttonStyle(PillButtonStyle())
//                Spacer()
            }
        }
    }
}
