//
//  ContentView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//
// Landing Page/ Home Page

import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var session: Session
    
    var body: some View {
        NavigationView {
            ThemedBackground {
                VStack(spacing: 40){
                    Text("Lume Cars")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 50)
                        .foregroundColor(Color("accent"))
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                    Spacer()
                    
                    if let user = session.currentUser {
                        Text("Welcome back, \(user.username)!")
                            .font(.title2)
                            .padding()
                        NavigationLink("Profile", destination: ProfileView())
                        NavigationLink("Catalogue", destination: CarCatalogueView())
                        NavigationLink("Search", destination: SearchView())
                        NavigationLink("Orders", destination: OrdersView())
                        
                        Button("Log out"){
                            session.logout()
                        }.buttonStyle(PillButtonStyle())
                    } else {
                        NavigationLink("Log In", destination: LoginView())
                        NavigationLink("Sign Up", destination: SignUpView())
                        NavigationLink("Car Catalogue", destination: CarCatalogueView())
                        NavigationLink("Search", destination: SearchView())
                    }
                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle("Home")
    }
}

//#Preview {
//    let container = try! ModelContainer(for: User.self, Car.self)
//    let session = Session(container: container)
//    ContentView()
//        .environmentObject(session)
//        .environment(\.modelContext, ModelContext(container))
//}
