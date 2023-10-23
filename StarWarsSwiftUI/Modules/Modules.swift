//
//  Modules.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import SwiftUI

/*
    'Hashable'
        used to uniqueally compare two Modules aka identify them being unique
 */
enum Module: Hashable {
    
    static func == (lhs: Module, rhs: Module) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    case main
    case peopleList     ([Person])
    case personDetails  (Person)
    case filters        (selectedFilters: Binding<[PeopleFilter]>)
    
    var id: String {
        switch self {
        case .main:             return "main"
        case .peopleList:       return "peopleList"
        case .personDetails:    return "personDetails"
        case .filters:          return "filters"
        }
    }
}

extension Module {
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .main:                         MainView()
        case .peopleList(let people):       PeopleListView(people: people)
        case .personDetails(let person):    PersonDetailsView(person: person)
            
        case let .filters(selectedFilters: selectedFilters):    FilterView(selectedFilters: selectedFilters)
        }
    }
    
    var navigationEmbeded: some View {
        NavigationContainer {
            self.view
        }
    }
}

extension Module {
    
    static func showNavigationEmbeded(_ module: Module) -> some View {
        return module
            .navigationEmbeded
    }
}

extension View {
    
    func push(_ module: Module) -> some View {
        return self.modifier(NavigateViewModifier(module: module))
    }
}

struct NavigateViewModifier: ViewModifier {
    
    let module: Module
    
    func body(content: Content) -> some View {
        NavigationLink(value: module) {
            content
        }
    }
}


