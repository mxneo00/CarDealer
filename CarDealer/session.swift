//
//  session.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/15/25.
//

import SwiftUI
import SwiftData

class Session: ObservableObject {
    var currentUser: Bool?
    private let container: ModelContainer
    
    init(container: ModelContainer) {
        self.container = container
    }
}
