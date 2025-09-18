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
        LazyVStack {
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
            Text("\(car.brand) \(car.model) \(car.year, format: .number.grouping(.never)) $\(car.price, specifier: "%.0f")").cardStyle()
        }.cardStyle()
    }
}

struct CarCatalogueView: View {
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
    CarCatalogueView()
}
