//
//  like.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
//

import SwiftUI
import SwiftData

@Model class Like {
    @Attribute(.unique) var id: UUID = UUID()
    var createdAt: Double = Date().timeIntervalSince1970
    var user: User
    var car: Car
    
    init(user: User, car: Car) {
        self.user = user
        self.car = car
    }
}
