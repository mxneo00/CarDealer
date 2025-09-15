//
//  ContentView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("Home Page")
                
                NavigationLink("Login", destination: LoginView())
                NavigationLink("Sign Up", destination: SignUpView())
                //NavigationLink("Profile", destination: ProfileView())
                NavigationLink("Car Catalogue", destination: carCatalogueView())
                //NavigationLink("Car Listings", destination: CarListingView())
            }
        }
        .navigationTitle("Home")
    }
}

#Preview {
    ContentView()
}
