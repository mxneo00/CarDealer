//
//  like.swift
//  CarDealer
//
//  Created by Student on 9/18/25.
//

import SwiftUI
import SwiftData

@Model class Like {
    @Attribute(.unique) var id: UUID
    var createdAt: Double = Date().timeIntervalSince1970
    var user: User
    var car: Car
    
    init(id: UUID, user: User, car: Car) {
        self.id = id
        self.user = user
        self.car = car
    }
}
