//
//  MainViewModel.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import Combine
import Foundation

class MainViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var people: [Person] = []
    @Published var error: ServiceError? = nil
    @Published var isLoaderActive: Bool = false
    
    func getPeople() {
        
        isLoaderActive = true

        PeopleServices().getAll()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoaderActive = false
                case .failure(let serviceError):
                    self?.error = serviceError
                }
            }, receiveValue: { [weak self] people in
                self?.people = people
            })
            .store(in: &cancellables)
    }
}
