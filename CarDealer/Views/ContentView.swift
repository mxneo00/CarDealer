//
//  ContentView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: Session
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40){
                Text("CarDealer")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 50)
                Spacer()
                
                if let user = session.currentUser {
                    Text("Welcome back, \(user.username)!")
                        .font(.title2)
                        .padding()
                    NavigationLink("Profile", destination: ProfileView())
                    NavigationLink("Car Catalogue", destination: CarCatalogueView())
                    
                    Button("Log out"){
                        session.logout()
                    }
                    .padding(.top, 20)
                } else {
                    NavigationLink("Log In", destination: LoginView())
                    NavigationLink("Sign Up", destination: SignUpView())
                    NavigationLink("Car Catalogue", destination: CarCatalogueView())
                }
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Home")
    }
}

#Preview {
    ContentView()
}
