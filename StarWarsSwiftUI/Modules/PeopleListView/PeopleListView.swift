//
//  PeopleListView.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import SwiftUI

struct PeopleListView: View {
    
    @EnvironmentObject var navManager: NavigationManager
    @StateObject private var viewModel: PeopleListViewModel
    
    init(people: [Person]) {
        _viewModel = StateObject(wrappedValue: PeopleListViewModel(people: people))
    }
    
    var body: some View {
        List(viewModel.people, id: \.name) { person in
            Text(person.name)
                .frame(height: 50)
                .padding(.leading, 20)
                .onTapGesture {
                    navManager.push(.personDetails(person))
                }
        }
        .listStyle(PlainListStyle())    // remove the default padding against the container
        .navigationBarTitle("People")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // [ QUESTION ]
                    // navManager.push(.filters(selectedFilters: $viewModel.filters))
                    // ?? why this will not work? the FilterView is not refreshing its UI when values change?
                    viewModel.isFiltersViewPresented.toggle()
                }) {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                }
            }
        }
        // presents a modal view
        .sheet(isPresented: $viewModel.isFiltersViewPresented) {
            Module.filters(selectedFilters: $viewModel.filters).view
        }
    }
}
