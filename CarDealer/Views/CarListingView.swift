//
//  CarListingView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//

import SwiftUI

struct CarListingView: View {
    let listing: Listing?
    let car: Car?
    
    init(listing: Listing) {
        self.listing = listing
        self.car = nil
    }
    
    init(car: Car) {
        self.listing = nil
        self.car = car
    }
    
    
    var body: some View {
        if let listing = listing {
            Text("Listing: \(listing.car.brand) \(listing.car.model) \(listing.car.year)")
        } else if let car = car {
            Text("Car: \(car.brand) \(car.model) \(car.year)")
        } else {
            Text("No data")
        }
    }
}

#Preview {
    //CarListingView()
}
