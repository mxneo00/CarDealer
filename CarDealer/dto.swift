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
    let model: String
    let year: Int
    let specs: SpecsDTO
    let price: Float
    let url: String?
    let owner: UserDTO? = nil
    
    enum CodingKeys: String, CodingKey {
        case model, year, specs, price, url, owner
    }
}
