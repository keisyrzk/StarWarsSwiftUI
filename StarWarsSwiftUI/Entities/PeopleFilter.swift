//
//  PeopleFilter.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 18/10/2023.
//

import Foundation

enum PeopleFilter: Equatable {
    
    case gender(Gender)
    case mass(Double)


}

extension PeopleFilter {
    
    var massValue: Double? {
        if case let .mass(massValue) = self {
            return massValue
        }
        return nil
    }
}

extension PeopleFilter {
    
    static func == (lhs: PeopleFilter, rhs: PeopleFilter) -> Bool {
        switch (lhs, rhs) {
        case let (.gender(leftGender), .gender(rightGender)):
            return leftGender == rightGender
        case let (.mass(leftMass), .mass(rightMass)):
            return leftMass == rightMass
        default:
            return false
        }
    }
}
