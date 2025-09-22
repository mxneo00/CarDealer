//
// templates.swift
// CarDealer
//
// Created by Katellyn Hyker on 9/21/25
//

import SwiftUI

struct ThemedBackground<Content: View>: View {
    let content: Content
    @Environment(\.theme) var brand

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View{
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [brand.palette.secondary,
                    brand.palette.secondary,
                    brand.palette.primary
                ]),
                center: .center,
                startRadius: 60,
                endRadius: 450
            )
            .ignoreSafeArea()

            content
        }
    }
}