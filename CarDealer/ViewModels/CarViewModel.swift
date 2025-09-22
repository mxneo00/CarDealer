//
//  CarViewModel.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
//

import SwiftUI
import SwiftData

class CarViewModel: ObservableObject, Identifiable {
//    @Published var dto: CarDTO? = nil
//    
//    let id: UUID = UUID()
//    let brand: String
//    let model: String
//    let year: Int
//    @Published var price: Float
//    let horsepower: Int
//    let fuelType: String
//    let engine: String
//    let url: String?
//    
//    init(dto: CarDTO) {
//        self.dto = dto
//        self.brand = dto.brand
//        self.model = dto.model
//        self.year = dto.year
//        self.price = dto.price
//        self.horsepower = dto.specs.horsepower
//        self.fuelType = dto.specs.fuelType
//        self.engine = dto.specs.engine
//        self.url = dto.url
//    }
    @Environment(\.modelContext) var ctx: ModelContext
    @Published var car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    static func fromJSON(dto: CarDTO) -> CarViewModel {
        let dto_url = dto.url ?? "generic_car"
        let car = Car(
            brand: dto.brand, model: dto.model, year: dto.year, price: dto.price, miles: 50000, owner: User.preview
        )
        car.carURL = dto_url
        let CVM = CarViewModel(car: car)
        return CVM
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
