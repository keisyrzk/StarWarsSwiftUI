//
//  Managers.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import SwiftUI

struct Managers: ViewModifier {
    
    private static let navigationManager    = NavigationManager()
    
    func body(content: Content) -> some View {
        content
            .environmentObject(Self.navigationManager)
    }
}
