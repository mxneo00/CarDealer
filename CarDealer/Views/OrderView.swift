//
//  OrderView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/22/25.
//

import SwiftUI
import SwiftData

struct OrderView: View {
    @ObservedObject var carVM: CarViewModel
    @State private var orderPrice: String
    
    init(carVM: CarViewModel) {
        self.carVM = carVM
        _orderPrice = State(initialValue: String(carVM.car.price))
    }
    
    var body: some View {
        VStack {
            Text("Confirm Purchase")
                .font(.headline)
            StyledSection(title: "Price") {
                TextField("Price", text: $orderPrice)
                    .keyboardType(.decimalPad)
            }
            Button(action: placeOrder) {
                Text("Place Order")
            }.buttonStyle(PillButtonStyle())
        }.formStyle()
    }
    
    private func placeOrder() {
        if let price = Double(orderPrice) {
            print("Placing order for \(carVM.car.brand) \(carVM.car.model) at $\(price)")
        } else {
            print("Invalid price input: \(orderPrice)")
        }
    }
}

struct OrdersView: View {
    var orders: [SellTabViewModel] = []
    
    var body: some View {
        NavigationStack {
            ThemedBackground {
                VStack {
                    NavigationLink(destination: SellView()) {
                        Text("Sell Car")
                    }.buttonStyle(PillButtonStyle())
                    Spacer()
                }
            }
        }
    }
}
