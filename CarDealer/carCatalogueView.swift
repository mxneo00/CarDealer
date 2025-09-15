//
//  CarCatalogueView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//

import Foundation
import SwiftUI

class CarViewModel: ObservableObject, Identifiable {
    @Published var dto: CarDTO? = nil
    
    let id: UUID = UUID()
    let brand: String
    let model: String
    let year: Int
    @Published var price: Float
    let horsepower: Int
    let fuelType: String
    let engine: String
    let url: String?
    
    init(dto: CarDTO) {
        self.dto = dto
        self.brand = dto.brand
        self.model = dto.model
        self.year = dto.year
        self.price = dto.price
        self.horsepower = dto.specs.horsepower
        self.fuelType = dto.specs.fuelType
        self.engine = dto.specs.engine
        self.url = dto.url
    }
}

class CarCollection: ObservableObject, Identifiable {
    @Published var cars: [CarViewModel] = []
    
    init() {
        let loader = JSONLoader()
        do {
            var carDTOs = try loader.load([CarDTO].self, path: "cars.json")
            for car in carDTOs {
                cars.append(CarViewModel(dto: car))
            }
        } catch {
            print("Error loading json")
        }
    }
}

struct CarCard: View {
    var car: CarViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("\(car.brand) \(car.model) \(car.year)")
        }
    }
}

struct CarCatalogueView: View {
    @StateObject var collection: CarCollection = CarCollection()
    
    
    var body: some View {
        ScrollView {
            
        }
    }
}

#Preview {
    CarCatalogueView()
}
