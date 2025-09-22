//
//  OrderViewModel.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/22/25.
//

import SwiftUI
import SwiftData

struct OrderVM: ObservableObject, Identifiable {
    @Published var order: Order
    
    init(order: Order) {
        self.order = order
    }
}
