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
    //let CVM: CarViewModel
    @ObservedObject var CVM: CarViewModel
    
    var body: some View {
        VStack {
            // Old Card
            //Image(systemName: "globe")
            //Text("\(CVM.brand) \(CVM.model) \(CVM.year)")

            // New Card
            VStack (alignment: .leading, spacing: 12) {
                // Image
                ZStack(alignment: .topLeading) {
                    Color.gray.opacity(0.4)
                    Image(systemName: "car.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .clipped()

                        Text("Certified")
                            .font(.caption.bold())
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(6)
                            .padding(8)

                    HStack {
                        Spacer()
                        Text("19.99")
                            .font(.headline.bold())
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(12)
                            .padding(8)
                    }
                }

                // Car info
                VStack(alignment: .leading, spacing: 4) {
                    Text(CVM.brand)
                        .font(.headline)
                    Text(CVM.model)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    HStack(spacing: 16) {
                        Label("\(CVM.year)", systemImage: "gauge")
                        Label("\(CVM.fuelType)", systemImage: "fuelPump")
                        //Label("\(CVM.car.year)", systemImage: "paintpalette")
                        //Label("\(CVM.car.year)", systemImage: "gearshape")
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }.padding(9)
                NavigationLink(destination: CarDetailView(listing: Listing)) {
                    Text("View Details")
                        .font(.callout.bold())
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(colors: [.cyan, .blue], startPoint: .leading, endPoint: .trailing)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                }
            }
            .background(Color.white)
            .cornerRadius(16)
            .shadow(radius: 4, y: 2)
            .padding(.horizontal)
        }
    }
}

// Old
//struct CarRow: View{
//    @ObservedObject var CVM: CarViewModel
//    
//    var body: some View {
//        LazyVStack {
//            if let url = CVM.url {
//                Image(url)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width:150, height: 150)
//            } else {
//                Image("generic")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 150, height: 150)
//            }
//            Text("\(CVM.brand) \(CVM.model) \(CVM.year, format: .number.grouping(.never)) $\(CVM.price, specifier: "%.0f")").cardStyle()
//        }.cardStyle()
//    }
//}

struct CarCatalogueView: View {
    @StateObject var collection: CarCollection = CarCollection()
    
    var body: some View {
        // Old
        //ScrollView {
        //    ForEach(collection.cars) { car in
        //        NavigationLink(destination: CarCard(car: car)) {
        //            CarRow(car: car)
        //        }
        //    }
        //}

        ThemedBackground {
            ScrollView {
                LazyVStack {
                    ForEach(collection.cars) { CVM in
                        CarCard(CVM: CVM)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    CarCatalogueView()
}
