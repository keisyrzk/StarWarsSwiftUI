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
        /*
         .environmentObject
            - injects an environment object into the view hierarchy.
            - it provides an environment object to the view and all its child views within the view hierarchy.
         
         "Self"
            is a convention in Swift to refer to the type itself. It distinguishes it from referring to an instance of the type
         */
        content
            .environmentObject(Self.navigationManager)
    }
}
