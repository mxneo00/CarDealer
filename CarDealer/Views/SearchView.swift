//
//  SearchView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
//

import SwiftUI

struct SearchView: View {
    @State private var query: String = ""
    @ObservedObject var collection = CarCollection()

    var filteredCars: [CarViewModel] {
        if query.isEmpty {
            return collection.cars
        } else {
            return collection.cars.filter { car in
                car.brand.localizedCaseInsensitiveContains(query) ||
                car.model.localizedCaseInsensitiveContains(query) ||
                String(car.year).contains(query) ||
                car.fuelType.localizedCaseInsensitiveContains(query) ||
                car.engine.localizedCaseInsensitiveContains(query)
            }
        }
    }

    var body: some View {
        NavigationStack {
            List(filteredCars) { car in
                VStack(alignment: .leading) {
                    Text("\(car.year) \(car.brand) \(car.model)")
                        .font(.headline)
                    Text("$\(car.price, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Search Cars")
            .searchable(text: $query, prompt: "Search make, model, year...")
        }
    }
}
