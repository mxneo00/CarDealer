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

struct CarDTO: Identifiable, Codable {
    let id: UUID = UUID()
    let model: String
    let year: Int
    let price: Float
    let url: String?
    let owner: UserDTO? = nil
    
    enum CodingKeys: String, CodingKey {
        case model, year, price, url, owner
    }
}
