//
//  ServiceCategory.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import Foundation

// category reflects common API structure
enum ServiceCategory {
    
    case people (PeopleServicesType)
    
    var requestEndpoint: String {
        switch self {
        case let .people(service):  return service.endpoint
        }
    }
}
