//
//  PeopleContainer.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import Foundation

// data container when requesting for people list
struct PeopleContainer: Decodable {
    let count:      Int
    let next:       String?
    let previous:   String?
    let results:    [Person]
}
