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
        ContentView()
    }
}

@main
struct CarDealerApp: App {
    var container: ModelContainer
    init() {
        let schema = Schema([User.self, Car.self, Listing.self, Like.self, Order.self])
        let configuration = ModelConfiguration(schema: schema)
        self.container = try! ModelContainer(for: schema, configurations: [configuration])
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                //.environment(\.modelContext, ModelContext(container))
                .environmentObject(Session(container: container))
        }
        .modelContainer(container)
    }
}
