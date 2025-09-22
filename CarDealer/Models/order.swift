//
//  order.swift
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

    @Relationship(inverse: \User.buyOrders) var buyer: User?
    @Relationship(inverse: \User.sellOrders) var seller: User?
    @Relationship(inverse: \Car.orders) var car: Car?

    init(buyer: User? = nil,seller: User? = nil, car: Car? = nil, status: OrderStatus = .pending) {
        self.id = UUID()
        self.createdAt = Date()
        self.status = status
        self.buyer = buyer
        self.seller = seller
        self.car = car
    }
}
