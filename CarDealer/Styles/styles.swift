//
//  styles.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/15/25.
//

import SwiftUI

struct PillButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(Capsule().fill(configuration.isPressed ? .blue.opacity(0.7) : .blue))
            .foregroundStyle(.white)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

struct CardStyle: ViewModifier {
    @Environment(\.theme) private var theme
    @Environment(\.cornerRadius) private var radius
    
    func body(content: Content) -> some View {
        content.padding(48)
            .background(
                RoundedRectangle(cornerRadius: radius)
                    .fill(Color(.secondarySystemBackground))
            )
            .shadow(radius: theme == .brand ? 12 : 6)
    }
}

extension View {
    func cardStyle() -> some View { modifier(CardStyle()) }
}
