//
//  SellView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/22/25.
//

import SwiftUI

struct SellView: View {
    @EnvironmentObject var session: Session
    @Environment(\.modelContext) var ctx
    @StateObject private var sellVM = SellTabViewModel()
    
    var body: some View {
        VStack {
            StyledSection(title: "Brand") {
                TextField("Brand", text: $sellVM.brand)
                    .formFieldStyle()
            }
            StyledSection(title: "Model") {
                TextField("Model", text: $sellVM.model)
                    .formFieldStyle()
            }
            StyledSection(title: "Year") {
                TextField("Year", text: $sellVM.yearInput)
                    .formFieldStyle()
                    .keyboardType(.numberPad)
            }
            StyledSection(title: "Price") {
                TextField("Price", text: $sellVM.priceInput)
                    .formFieldStyle()
                    .keyboardType(.numberPad)
            }
            Button("Create Listing") {
                sellVM.createListing(ctx: ctx, user: session.currentUser)
            }.buttonStyle(PillButtonStyle())
        }.formStyle().padding(.horizontal)
    }
}
