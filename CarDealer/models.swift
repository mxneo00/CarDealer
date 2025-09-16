//
//  models.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/15/25.
//

import SwiftUI
import SwiftData

@Model class User {
    @Attribute(.unique) var id: UUID = UUID()
    @Attribute(.unique) var username: String
    @Attribute(.unique) var email: String
    var fname: String
    var lname: String
    var avatarURL: String = "default_avatar"
    var passwordDigest: String
    var accountActivated: Bool = false
    var createdAt: Date
    var updatedAt: Date
    
    func name() -> String {
        return "\(fname) \(lname)"
    }
    
    init(username: String, email: String, fname: String, lname: String, avatarURL: String, passwordDigest: String, createdAt: Date, updatedAt: Date) {
        self.username = username
        self.email = email
        self.fname = fname
        self.lname = lname
        self.avatarURL = avatarURL
        self.passwordDigest = passwordDigest
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
}

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

@Model class Listing {
    @Attribute(.unique) var id: UUID
    var createdAt: Date
    var updatedAt: Date
    var price: Float
    var car: Car
    var seller: User
    var isSold: Bool
    
    init(id: UUID, createdAt: Date, updatedAt: Date, price: Float, car: Car, seller: User, isSold: Bool) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.price = price
        self.car = car
        self.seller = seller
        self.isSold = isSold
    }
}

@Model class Like {
    @Attribute(.unique) var id: UUID
    var createdAt: Date
    var user: User
    var car: Car
    
    init(id: UUID, createdAt: Date, user: User, car: Car) {
        self.id = id
        self.createdAt = createdAt
        self.user = user
        self.car = car
    }
}
