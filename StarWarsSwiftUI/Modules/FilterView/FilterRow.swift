//
//  FilterRow.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 18/10/2023.
//

import SwiftUI

struct FilterRow: View {

    var title: String
    @Binding var isSelected: Bool
        
    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            HStack {
                Text(title)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
