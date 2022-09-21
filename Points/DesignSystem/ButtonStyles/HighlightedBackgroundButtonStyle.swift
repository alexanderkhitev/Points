//
//  HighlightedBackgroundButtonStyle.swift
//  Points
//
//  Created by Alexander Khitev on 9/21/22.
//

import Foundation
import SwiftUI

struct HighlightedBackgroundButtonStyle: ButtonStyle {
    var foregroundColor: Color?
    var backgroundColor: Color = .clear
    var pressedBackgroundColor: Color = .clear

    init(foregroundColor: Color? = nil, backgroundColor: Color = .clear, pressedBackgroundColor: Color = .clear) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.pressedBackgroundColor = pressedBackgroundColor
    }

    func makeBody(configuration: Configuration) -> some View {
        if let foregroundColor {
            configuration
                .label
                .foregroundColor(foregroundColor)
                .background(configuration.isPressed ? pressedBackgroundColor : backgroundColor)
        } else {
            configuration
                .label
                .background(configuration.isPressed ? pressedBackgroundColor : backgroundColor)
        }
    }
}
