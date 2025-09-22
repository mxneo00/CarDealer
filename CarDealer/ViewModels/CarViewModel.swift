//
//  CarViewModel.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
//

import SwiftUI
import SwiftData

class CarViewModel: ObservableObject, Identifiable {
    @Environment(\.modelContext) var ctx: ModelContext
    @Published var car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    static func fromJSON(dto: CarDTO) -> CarViewModel {
        let dto_url = dto.url ?? "generic_car"
        let car = Car(
            brand: dto.brand, model: dto.model, year: dto.year, price: dto.price, miles: 50000, owner: nil
        )
        car.carURL = dto_url
        let carVM = CarViewModel(car: car)
        return carVM
    }
    

}

class CarCollection: ObservableObject, Identifiable {
    @Published var carVMs: [CarViewModel] = []
    @Query var cars: [Car]
    
    init() {
        let loader = JSONLoader()
        do {
            let carDTOs = try loader.load([CarDTO].self, path: "cars.json")
            for car in carDTOs {
                carVMs.append(CarViewModel.fromJSON(dto: car))
            }
        } catch {
            print("Error loading json")
        }
    }
}
