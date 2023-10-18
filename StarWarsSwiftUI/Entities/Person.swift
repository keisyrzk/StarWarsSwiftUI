//
//  Person.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import Foundation

struct Person: Decodable {
    
    let name:       String
    let height:     String
    let mass:       String
    let gender:     Gender
    let homeworld:  String
    let films:      [String]
    
    // prints Person data in a pretty way
    var prettyPrinted: String {
        return [
            name,
            height,
            mass,
            gender.rawValue,
            homeworld
        ].joined(separator: "\n")
    }
}

extension Person {
    
    // get uriId from the `homeworld` String (it is an url string)
    var homeworldId: String? {
        return homeworld.uriId
    }
    
    // get all not-nil uriIds from films
    var filmsIds: [String] {
        return films.compactMap{ $0.uriId }
    }
}

// extension to an array of Person objects like [Person] that prints the components the pretty way
extension Array where Element == Person {
    
    var prettyPrinted: String {
        return self.map{ $0.prettyPrinted }.joined(separator: "\n")
    }
}

extension Person {
    
    static let dummyPersonData =
        Person(name: "Obi Wan",
               height: "182",
               mass: "80",
               gender: .male,
               homeworld: "Galaxy",
               films: [])
    
    static let dummyPeopleData =
        [
            Person.dummyPersonData,
            Person(name: "Anakin",
                   height: "180",
                   mass: "78",
                   gender: .male,
                   homeworld: "Tatooine",
                   films: [])
        ]
}
