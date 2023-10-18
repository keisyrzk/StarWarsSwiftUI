//
//  IDExtractor.swift
//  StarWarsSwiftUI
//
//  Created by Krzysztof Banaczyk on 17/10/2023.
//

import Foundation

extension String {
    
    /// extract uri id from the given String
    var uriId: String? {
        if let lastPathComponent = self.split(separator: "/").last {
            return String(lastPathComponent)
        }
        else {
            print("Unable to extract number")
            return nil
        }
    }
}
