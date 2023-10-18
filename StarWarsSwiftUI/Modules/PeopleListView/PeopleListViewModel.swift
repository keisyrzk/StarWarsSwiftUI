//
//  PeopleListViewModel.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import Foundation

class PeopleListViewModel: ObservableObject {
    
    private let allPeople: [Person]
    
    @Published var people:  [Person] = []
    @Published var filters: [PeopleFilter] = []{
        didSet {
            applyFilters()
        }
    }
    @Published var isFiltersViewPresented: Bool = false
    
    init(people: [Person]) {
        self.allPeople = people
        self.people = people
    }
    
    private func applyFilters() {

        var filteredPeople = allPeople
        
        for filter in filters {
            switch filter {
            case .gender(let gender):
                filteredPeople = filteredPeople.filter { $0.gender == gender }
            case .mass(let massValue):
                filteredPeople = filteredPeople.filter { Double($0.mass) ?? 0.0 <= massValue }  // show all that have mass below the filter value
            }
        }
        
        people = filteredPeople
    }
}
