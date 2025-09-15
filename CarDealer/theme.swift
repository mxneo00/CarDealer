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
        let cardBackground: Color
        let danger: Color
    }
    struct Spacing: Equatable { let xs: CGFloat; let sm: CGFloat; let md: CGFloat; let lg: CGFloat; let xl: CGFloat}
    struct Radii: Equatable {let sm: CGFloat; let md: CGFloat; let lg: CGFloat}
    
    let palette: Palette
    let spacing: Spacing
    let radii: Radii
    
    static let brand = Theme(
        palette: .init(
            primary: Color("brand"),
            secondary: Color("brandSecondary"),
            onPrimary: .white,
            cardBackground: Color(.systemGray),
            danger: .red
        ),
        spacing: .init(xs: 4, sm: 8, md: 16, lg: 24, xl: 32),
        radii: .init(sm: 4, md: 8, lg: 16)
    )
}
