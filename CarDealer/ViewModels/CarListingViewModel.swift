//
//  CarListingViewModel.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
//

import SwiftUI
import SwiftData

class SellTabViewModel: ObservableObject {
    @Published var brand: String = ""
    @Published var model: String = ""
    @Published var yearInput: String = ""
    @Published var priceInput: String = ""
    @Published var imageURL: String = ""
    var year: Int? { Int(yearInput) }
    var price: Float? { Float(priceInput)}
    
    func createListing(ctx: ModelContext, user: User?) {
        guard let year = year, let price = price, let user = user else {
            print("Error")
            return
        }
        
        let car = Car(brand: brand, model: model, year: year, price: price, carURL: imageURL.isEmpty ? "default_car": imageURL, miles: 50000, owner: User.preview)
        let listing = Listing(price: price, car: car, seller: user)
        
        user.listings.append(listing)
        ctx.insert(car)
        ctx.insert(listing)
        
        do {
            try ctx.save()
            print("Listing created")
        } catch {
            print("Listing Failed \(error.localizedDescription)")
        }
        
    }
    
    private func resetForm() {
        brand = ""
        model = ""
        yearInput = ""
        priceInput = ""
        imageURL = ""
    }
    
}
