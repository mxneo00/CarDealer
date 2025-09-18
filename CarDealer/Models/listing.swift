//
//  listing.swift
//  CarDealer
//
//  Created by Student on 9/18/25.
//

import SwiftUI
import SwiftData

@Model class Listing {
    @Attribute(.unique) var id: UUID
    var createdAt: Double = Date().timeIntervalSince1970
    var updatedAt: Double = Date().timeIntervalSince1970
    var price: Float
    var car: Car
    var seller: User
    var isSold: Bool
    
    init(id: UUID, price: Float, car: Car, seller: User, isSold: Bool) {
        self.id = id
        self.price = price
        self.car = car
        self.seller = seller
        self.isSold = isSold
    }
}
