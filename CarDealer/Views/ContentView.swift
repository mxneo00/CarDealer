//
//  ContentView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//

import SwiftUI
import SwiftData

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
                    NavigationLink("Car Catalogue", destination: CarCatalogueView(carVM: carVM))
                    
                    Button("Log out"){
                        session.logout()
                    }.buttonStyle(PillButtonStyle())
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
    let container = try! ModelContainer(for: User.self, Car.self)
    let session = Session(container: container)
    ContentView()
        .environmentObject(session)
        .environment(\.modelContext, ModelContext(container))
}
