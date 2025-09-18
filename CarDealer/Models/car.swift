//
//  User.swift
//  CarDealer
//
//  Created by Student on 9/18/25.
//

import SwiftUI
import SwiftData

@Model class Car {
    @Attribute(.unique) var id: UUID = UUID()
    var brand: String
    var model: String
    var year: Int
    var price: Float
    var carURL: String = "default_car"
    var owner: User?
    
    func carName() -> String {
        return "\(year) \(brand) \(model)"
    }
    
    init(brand: String, model: String, year: Int, price: Float, carURL: String, owner: User? = nil) {
        self.brand = brand
        self.model = model
        self.year = year
        self.price = price
        self.carURL = carURL
        self.owner = owner
    }
    
}
