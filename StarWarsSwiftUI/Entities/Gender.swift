//
//  Gender.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import Foundation

enum Gender: String, Decodable, CaseIterable {
    case male
    case female
    case na = "n/a"
}
