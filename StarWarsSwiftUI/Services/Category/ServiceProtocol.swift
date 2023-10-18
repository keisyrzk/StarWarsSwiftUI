//
//  ServiceProtocol.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import Foundation

// to ensure the `endpoint` attribute is present in all `Services`
protocol Service {
    var endpoint: String { get }
}
