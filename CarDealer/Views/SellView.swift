//
//  SellView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/22/25.
//
// Form for users to fill out to create new Listings

import SwiftUI

struct SellView: View {
    @EnvironmentObject var session: Session
    @Environment(\.modelContext) var ctx
    @StateObject private var sellVM = SellTabViewModel()
    
    var body: some View {
        ThemedBackground {
            ScrollView {
                VStack {
                    StyledSection(title: "Brand") {
                        TextField("Brand", text: $sellVM.brand).formFieldStyle()
                    }
                    StyledSection(title: "Model") {
                        TextField("Model", text: $sellVM.model).formFieldStyle()
                    }
                    StyledSection(title: "Year") {
                        TextField("Year", text: $sellVM.yearInput).formFieldStyle()
                            .keyboardType(.numberPad)
                    }
                    StyledSection(title: "Price") {
                        TextField("Price", text: $sellVM.priceInput).formFieldStyle()
                            .keyboardType(.decimalPad)
                    }
                    StyledSection(title: "miles") {
                        TextField("Miles", text: $sellVM.milesInput).formFieldStyle()
                            .keyboardType(.numberPad)
                    }
                    //                StyledSection(title: "Image") {
                    //                    CameraRollView { image in
                    //                        if let path = saveImageToDocuments(image: image) {
                    //                            sellVM.car.carURL = path
                    //                        }
                    //                    }
                    //                }
                    Button("Create Listing") {
                        sellVM.createListing(ctx: ctx, user: session.currentUser)
                    }.buttonStyle(PillButtonStyle())
                }.formStyle().padding(.horizontal)
            }
        }.ignoresSafeArea()
    }
    
    func saveImageToDocuments(image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 0.8) else {return nil}
        let filename = UUID().uuidString + ".jpg"
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(filename)
        do {
            try data.write(to: url)
            return url.path
        } catch {
            print("Error saving image")
            return nil
        }
    }
}
