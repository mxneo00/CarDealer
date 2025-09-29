//
//  environment.swift
//  CarDealer
//
//  Created by Katellyn Hyker on 9/15/25.
//

import SwiftUI

private struct CornerRadiusKey: EnvironmentKey {
    static let defaultValue: CGFloat = 12
}

private struct ThemeKey: EnvironmentKey {
    static let defaultValue: Theme = .brand
}

extension EnvironmentValues {
    var cornerRadius: CGFloat {
        get { self[CornerRadiusKey.self]}
        set { self[CornerRadiusKey.self] = newValue }
    }
    
    var theme: Theme {
        get { self[ThemeKey.self]}
        set { self[ThemeKey.self] = newValue }
    }
}
