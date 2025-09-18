//
//  LikesViewModel.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
//

import SwiftUI
import SwiftData

class LikesViewModel: ObservableObject {
    @Published var likes: [Like] = []
    
    var ctx: ModelContext!
    var user: User!
    
//    init(ctx: ModelContext, user: User) {
//        self.ctx = ctx
//        self.user = user
//        getLikes()
//    }
    
    init() {}
    
    func getLikes() {
        do {
            let descriptor = FetchDescriptor<Like>(
                predicate: #Predicate { $0.user == self.user }
            )
            likes = try ctx.fetch(descriptor)
        } catch {
            print("Failed to fetch likes \(error)")
        }
    }
    
    func toggleLike(for car: Car) throws {
        if let exists = likes.first(where: { $0.car.id == car.id }) {
            ctx.delete(exists)
        } else {
            let newLike = Like(user: user, car: car)
            ctx.insert(newLike)
        }
        
        do {
            try ctx.save()
            getLikes()
        } catch {
            print("Failed to save likes \(error)")
        }
    }
    
    func isLiked(car: Car) -> Bool {
        likes.contains(where: { $0.car.id == car.id })
    }
    
}
