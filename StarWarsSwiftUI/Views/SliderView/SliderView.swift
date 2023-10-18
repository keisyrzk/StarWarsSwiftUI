//
//  SliderView.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 18/10/2023.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var selectedValue: Double
    
    var body: some View {
        VStack {
            Text("Selected Value: \(Int(selectedValue))")
                .font(.headline)
                .padding()
            
            Slider(value: $selectedValue, in: 50...150, step: 1)
                .padding(.horizontal, 20)
            
            HStack {
                Text("50")
                    .font(.subheadline)
                Spacer()
                Text("150")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}
