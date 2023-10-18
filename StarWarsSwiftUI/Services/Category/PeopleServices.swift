//
//  PeopleServices.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import Combine
import Foundation

enum PeopleServicesType: Service {
    
    case getAll
    case getPerson(id: String)
    
    var endpoint: String {
        switch self {
        case .getAll:               return "/people"
        case let .getPerson(id):    return "/people/\(id)"
        }
    }
}

struct PeopleServices {
    
    func getAll() -> AnyPublisher<[Person], ServiceError> {
        return services.request(.people(.getAll))
            .tryMap { (container: GenericContainer) -> [Person] in
                if case let .people(people) = container.results {
                        return people
                }
                else {
                    throw ServiceError.containerParsing("Generic Container Parsing failed")
                }
            }
            .mapError { error in
                return .containerParsing(error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
    
    func getPerson(id: String) -> AnyPublisher<Person, ServiceError> {
        return services.request(.people(.getPerson(id: id))).eraseToAnyPublisher()
    }
}
