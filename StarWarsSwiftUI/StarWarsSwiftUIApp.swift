//
//  StarWarsSwiftUIApp.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import SwiftUI

@main
struct StarWarsSwiftUIApp: App {
    
    @EnvironmentObject var navManager: NavigationManager
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modifier(Managers())   // make Managers available from anywhere in the app
        }
    }
}
