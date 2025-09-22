//
//  CarCatalogueView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//
// Car Catalogue View using JSON data
// TODO Add ability to also include any new listings created

import SwiftUI
import SwiftData

struct CarCatalogueView: View {
    @StateObject private var collection: CarCollection
    
    init(collection: CarCollection = CarCollection()) {
        _collection = StateObject(wrappedValue: collection)
    }
    
    var body: some View {

        ThemedBackground {
            ScrollView {
                LazyVStack {
                    ForEach(collection.carVMs) { carVM in
                        CarCard(carVM: carVM)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

//#Preview {
//    CarCatalogueView()
//}
