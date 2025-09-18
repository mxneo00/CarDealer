//
//  CarDealerApp.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/11/25.
//
// User and Car classes
// Session class

import SwiftUI
import SwiftData

struct RootView: View {
    @EnvironmentObject var session: Session
    
    var body: some View {
        if let _ = session.currentUser {
            ContentView()
        } else {
            LoginView()
        }
    }
}

@main
struct CarDealerApp: App {
    let container = try! ModelContainer(for: User.self, Car.self, Listing.self, Like.self)
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.modelContext, ModelContext(container))
                .environmentObject(Session(container: container))
        }
        .modelContainer(container)
    }
}
