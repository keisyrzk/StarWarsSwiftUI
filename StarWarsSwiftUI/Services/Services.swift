//
//  Services.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import Combine
import Foundation

let services = Services()

class Services {
    
    // list of API's categories/services
    let people  = PeopleServices()
        
}

extension Services {
        
    // an alternative approach using directly `dataTaskPublisher`
    func request<T: Decodable>(_ service: ServiceCategory) -> AnyPublisher<T, ServiceError> {
        
        let baseURL = "https://swapi.dev/api"
        
        guard let url = URL(string: baseURL + service.requestEndpoint) else {
            return Fail(error: ServiceError.wrongURL).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> ServiceError in
                if let decodingError = error as? DecodingError {
                    return .custom(decodingError.localizedDescription)
                } else if let urlError = error as? URLError {
                    return .custom(urlError.localizedDescription)
                } else {
                    return .custom(error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
    }
}
