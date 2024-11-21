//
//  BackGroundImage.swift
//  XnapperClone
//
//  Created by Long Vu on 16/11/24.
//

import Foundation
import SwiftUI

enum BackGroundImage: CaseIterable {
//    case Desktop, Cool, Beach, Violet, Rose, Love, Flower, Sky, none
    
    case Cool, Beach
    
    @ViewBuilder
    var value: some View {
        switch self {
        case .Beach:
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 62 / 255, green: 187 / 255, blue: 203 / 255),
                    Color(red: 115 / 255, green: 230 / 255, blue: 203 / 255)
                ]),
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )
        case .Cool:
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.blue,
                    Color(red: 247 / 255, green: 233 / 255, blue: 228 / 255)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
    }
}
