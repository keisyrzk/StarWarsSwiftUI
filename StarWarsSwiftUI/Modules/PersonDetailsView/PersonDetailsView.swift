//
//  PersonDetailsView.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import SwiftUI

struct PersonDetailsView: View {
    
    @EnvironmentObject var navManager: NavigationManager
    @State var person: Person
    
    var body: some View {
        
        VStack(content: {
            Text("\(person.prettyPrinted)")
        })
        .navigationBarTitle("Details")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    navManager.popToRoot()
                }) {
                    Text("to root")
                }
            }
        }
    }
}

#Preview {
    PersonDetailsView(person: Person.dummyPersonData)
}


