//
//  theme.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/15/25.
//

import SwiftUI

struct Theme: Equatable {
    struct Palette: Equatable {
        let primary: Color
        let secondary: Color
        let onPrimary: Color
        let accent: Color
        let buttonPrimary: Color
        let buttonSecondary: Color
        let cardBackground: Color
        let danger: Color
        let textField: Color
    }
    struct Spacing: Equatable { let xs: CGFloat; let sm: CGFloat; let md: CGFloat; let lg: CGFloat}
    struct Radii: Equatable {let sm: CGFloat; let md: CGFloat; let lg: CGFloat}
    struct Elevation: Equatable {let cardShadow: CGFloat}
    
    let palette: Palette
    let spacing: Spacing
    let radii: Radii
    let elevation: Elevation
    
    static let brand = Theme(
        palette: .init(
            primary: Color("brand"),
            secondary: Color("brandSecondary"),
            onPrimary: .white,
            accent: Color("accent"),
            buttonPrimary: Color("button"),
            buttonSecondary: Color("buttonSecondary"),
            cardBackground: Color(.secondarySystemBackground),
            danger: .red,
            textField: Color("brand")
        ),
        spacing: .init(xs: 4, sm: 8, md: 16, lg: 24),
        radii: .init(sm: 4, md: 8, lg: 16),
        elevation: .init(cardShadow: 6)
    )
}
