//
//  FilterView.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 18/10/2023.
//

import SwiftUI


struct FilterView: View {
    
    @Binding var selectedFilters: [PeopleFilter]
        
    var body: some View {
        
        Form {
            Section(header: Text("Gender")) {
                ForEach(Gender.allCases, id: \.self) { gender in
                    FilterRow(
                        title: gender.rawValue,
                        isSelected: Binding(
                            get: {
                                selectedFilters.contains(.gender(gender))
                            },
                            set: { newValue in
                                if let index = selectedFilters.firstIndex(of: .gender(gender)) {
                                    selectedFilters.remove(at: index)
                                } else {
                                    selectedFilters.append(.gender(gender))
                                }
                            }
                        )
                    )
                }
            }
            
            Section(header: Text("Mass")) {
                SliderView(selectedValue: Binding(
                    get: {
                        selectedFilters.first { filter in
                            if case .mass = filter {
                                return true
                            }
                            return false
                        }?.massValue ?? 100 // Default value
                    },
                    set: { newValue in
                        if let index = selectedFilters.firstIndex(where: {
                            if case .mass = $0 { return true }
                            return false
                        }) {
                            selectedFilters[index] = .mass(newValue)
                        } else {
                            selectedFilters.append(.mass(newValue))
                        }
                    }
                ))
            }
        }
    }
}

