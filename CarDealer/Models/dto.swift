//
//  dto.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/15/25.
//

import SwiftUI

struct UserDTO: Identifiable, Codable {
    let id: UUID = UUID()
    let fname: String
    let lname: String
    let age: Int
    
    enum CodingKeys: String, CodingKey {
        case fname, lname, age
    }
}

struct SpecsDTO: Codable {
    let engine: String
    let horsepower: Int
    let fuelType: String
    
    enum CodingKeys: String, CodingKey {
        case fuelType = "fuel_type"
        case engine, horsepower
    }
}

struct CarDTO: Identifiable, Codable {
    let id: UUID = UUID()
    let brand: String
    let model: String
    let year: Int
    let specs: SpecsDTO
    let price: Float
    let url: String?
    let owner: UserDTO? = nil
    
    enum CodingKeys: String, CodingKey {
        case brand, model, year, specs, price, url, owner
    }
}

struct ListingDTO: Identifiable, Codable {
    let id: UUID = UUID()
    let price: Float
    let car: CarDTO
    let seller: UserDTO? = nil
    let isSold: Bool
    
    enum CodingKeys: String, CodingKey {
        case price, car, seller, isSold
    }
}

struct LikeDTO: Identifiable, Codable {
    let id: UUID = UUID()
    let user: UserDTO
    let car: CarDTO
    
    enum CodingKeys: String, CodingKey {
        case user, car
    }
}

class CarAPI {
    private let url = URL(string: "https://storage.googleapis.com/cop4665/api_cars.json")!
    private var carDTOs: [CarDTO] = []
    
    func fetchCloudJSON() async throws -> [CarDTO] {
        let (data, _) = try await URLSession.shared.data(from: url)
        let cars = try JSONDecoder().decode([CarDTO].self, from: data)
        return cars
    }
    
    func toCarModel() throws -> [CarViewModel] {
        var carVMs: [CarViewModel] = []
        if self.carDTOs.isEmpty {
            //ValidationError.valueOutOfRange(message: "JSON has not been loaded")
            print("Error")
        } else {
            for dto in carDTOs {
                carVMs.append(CarViewModel.fromJSON(dto: dto))
            }
        }
        return carVMs
    }
}
