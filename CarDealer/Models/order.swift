//
//  User.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/21/25.
//

import SwiftUI
import SwiftData

enum OrderStatus: String, Codable {
    case pending, confirmed, delivered, cancelled
}

@Model class Order {
    @Attribute(.unique) var id: UUID
    var createdAt: Date
    var status: OrderStatus

    @Relationship(inverse: \User.orders) var user: User?
    @Relationship(inverse: \car.orders) var car: Car?

    init(user: User?, car: Car?, status: OrderStatus = .pending) {
        self.id = UUID()
        self.createdAt = Date()
        self.status = status
        self.user = user
        self.car = car
    }
}
