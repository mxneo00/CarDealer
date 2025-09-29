//
//  LikesView.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/18/25.
//

import SwiftUI
import SwiftData

//struct LikesView: View {
//    @Environment(\.modelContext) var ctx
//    @EnvironmentObject var session: Session
//    @StateObject private var vm: LikesViewModel
//    
//    init(user: User, ctx: ModelContext) {
//        _vm = StateObject(wrappedValue: LikesViewModel())
//    }
//    
//    var body: some View {
//        List(vm.likes, id: \.id) { like in
//            HStack {
//                Text("\(like.car.brand) \(like.car.model) $\(Int(like.car.price))")
//            }
//        }
//        .navigationTitle("My Likes")
//        .onAppear {
//            vm.getLikes()
//        }
//    }
//}
