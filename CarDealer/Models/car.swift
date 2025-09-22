//
//  User.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
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
    var fuelType: String?
    var engine: String?
    var horsepower: Int?
    var miles: Int = 0
    var owner: User?
    
    @Relationship(deleteRule: .nullify) var orders: [Order]
    
    func carName() -> String {
        return "\(year) \(brand) \(model)"
    }
    
    init(brand: String,
         model: String,
         year: Int,
         price: Float,
         carURL: String = "default_car",
         miles: Int = 0,
         owner: User? = nil) {
        self.brand = brand
        self.model = model
        self.year = year
        self.price = price
        self.carURL = carURL
        self.miles = miles
        self.owner = owner
        self.orders = []
    }
    
}
