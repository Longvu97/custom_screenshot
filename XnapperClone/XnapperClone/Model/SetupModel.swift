//
//  SetupModel.swift
//  XnapperClone
//
//  Created by Long Vu on 16/11/24.
//

import SwiftUI

class SetupModel: ObservableObject {
    @Published var present: String = "your"
    @Published var padding: Double = 10.0
    @Published var inset: Double = 0.0
    @Published var balance: Bool = true
    @Published var insetColor = Color.black
    @Published var rounded = 10.0
    @Published var shadow = 10.0
    @Published var background: AnyView = AnyView(LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 120 / 255, green: 65 / 255, blue: 118 / 255),
            Color(red: 237 / 255, green: 128 / 255, blue: 233 / 255)
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    ))
}
