//
//  MainView.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var navManager: NavigationManager
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        
        VStack {
            Spacer()
            peopleButton
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .overlay {
            LoaderView(isShowing: $viewModel.isLoaderActive)
        }
        .edgesIgnoringSafeArea(.all)
        .onReceive(viewModel.$people.filter{ !$0.isEmpty },perform: { people in
            navManager.push(.peopleList(people))
        })
        
    }
    
    private var peopleButton: some View {
        Button(action: {
            viewModel.getPeople()
        }) {
            Text("Get People")
                .font(.title2)
                .frame(height: 40)
                .padding(.horizontal, 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
        }
        .padding(.horizontal, 50)
        
    }
}
