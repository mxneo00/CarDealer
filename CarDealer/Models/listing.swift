//
//  listing.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
//

import SwiftUI
import SwiftData

@Model class Listing {
    @Attribute(.unique) var id: UUID = UUID()
    var createdAt: Double = Date().timeIntervalSince1970
    var updatedAt: Double = Date().timeIntervalSince1970
    var price: Float
    var car: Car
    var seller: User?
    var isSold: Bool = false
    
    init(price: Float, car: Car, seller: User? = nil, isSold: Bool = false) {
        self.price = price
        self.car = car
        self.seller = seller
        self.isSold = isSold
    }
}
