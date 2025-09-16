//
//  CarCatalogueView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//
// Car Catalogue View using JSON data

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
            let carDTOs = try loader.load([CarDTO].self, path: "cars.json")
            for car in carDTOs {
                cars.append(CarViewModel(dto: car))
            }
        } catch {
            print("Error loading json")
        }
    }
}

struct CarCard: View {
    @ObservedObject var car: CarViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("\(car.brand) \(car.model) \(car.year)")
        }
    }
}

struct CarRow: View{
    @ObservedObject var car: CarViewModel
    
    var body: some View {
        VStack {
            if let url = car.url {
                Image(url)
                    .resizable()
                    .scaledToFit()
                    .frame(width:150, height: 150)
            } else {
                Image("generic")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            }
        }
        Text("\(car.brand) \(car.model) \(car.year, format: .number.grouping(.never)) $\(car.price, specifier: "%.0f")")
    }
}

struct carCatalogueView: View {
    @StateObject var collection: CarCollection = CarCollection()
    
    var body: some View {
        ScrollView {
            ForEach(collection.cars) { car in
                NavigationLink(destination: CarCard(car: car)) {
                    CarRow(car: car)
                }
            }
        }
    }
}

#Preview {
    carCatalogueView()
}
