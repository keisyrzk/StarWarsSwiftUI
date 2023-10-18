//
//  ServiceError.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import Foundation

// custom errors definition
enum ServiceError: Error {
    
    case wrongURL
    case undefined
    case containerParsing(String)
    case wrongId
    case noIds
    
    case custom(String)
    
    // custom error message for each error case
    var message: String {
        switch self {
        case .wrongURL:                         return "Wrong URL"
        case .undefined:                        return "Undefined error"
        case .wrongId:                          return "The provided ID is not valid"
        case .noIds:                            return "The provided sequesce contains no valid IDs"
        case let .containerParsing(errorMsg):   return "Container parsing failed - \(errorMsg)"
        case let .custom(errorMsg):             return "Something went wrong - \(errorMsg)"
        }
    }
}
