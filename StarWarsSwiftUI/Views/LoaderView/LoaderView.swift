//
//  LoaderView.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import SwiftUI

struct LoaderView: View {
    
    @Binding var isShowing: Bool

    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(3.0)
                    .padding()
                    
                Text("Loading...")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.top, 40)
            }
            .cornerRadius(10)
            .padding()
        }
        .opacity(isShowing ? 1 : 0)
    }
}
