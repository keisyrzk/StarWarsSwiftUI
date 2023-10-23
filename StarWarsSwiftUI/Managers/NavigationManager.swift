//
//  NavigationManager.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import SwiftUI
import Combine

// Content is a generic parameter so the `NavigationContainer` may carry any `View` we like
struct NavigationContainer<Content>: View where Content: View {
    
    /*
     @EnvironmentObject var
        - a property wrapper used within a view to access an environment object that has been injected higher up in the view hierarchy using content.environmentObject
        - it allows a view to access and observe an environment object without needing to explicitly pass it down through the view hierarchy
     */
    @EnvironmentObject var navManager:      NavigationManager
    
    // we handle and manipulate the `path` on our own as the built-in is not comfortable and a bit tricky in use
    @State private var path: [Module] = []

    let content: Content
    
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            content
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color.white, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: Module.self) { module in
                    module.view
                }
        }
        .onReceive(navManager.popToRootPublisher) { _ in
            path = []
        }
        .onReceive(navManager.popPublisher) { _ in
            path.removeLast()
        }
        .onReceive(navManager.$pushModule) { module in
            guard let module = module else { return }
            path.append(module)
        }
    }
}

class NavigationManager: ObservableObject {
    
    fileprivate let popToRootPublisher = PassthroughSubject<Void, Never>()
    fileprivate let popPublisher = PassthroughSubject<Void, Never>()
    @Published fileprivate var pushModule: Module?
    
    func push(_ module: Module) {
        pushModule = module
    }
    
    func popToRoot() {
        popToRootPublisher.send()
    }
    
    func pop() {
        popPublisher.send()
    }
}
