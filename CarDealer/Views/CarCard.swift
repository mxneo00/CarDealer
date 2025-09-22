//
//  CarCollectionView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/22/25.
//

import SwiftUI
import SwiftData

struct CarCard: View {
    let carVM: CarViewModel
    
    var body: some View {
        VStack {
            // Card Outline
            VStack (alignment: .leading, spacing: 12) {
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
                    Text(carVM.car.brand)
                        .font(.headline)
                    Text(carVM.car.model)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    HStack(spacing: 16) {
                        Label("\(carVM.car.year, format: .number.grouping(.never))", systemImage: "gauge")
                        //Label("\(carVM.car.fuelType)", systemImage: "fuelPump")
                        //Label("\(CVM.car.year)", systemImage: "paintpalette")
                        //Label("\(CVM.car.year)", systemImage: "gearshape")
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }.padding(9)
                NavigationLink(destination: CarDetailView(carVM: carVM)) {
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
