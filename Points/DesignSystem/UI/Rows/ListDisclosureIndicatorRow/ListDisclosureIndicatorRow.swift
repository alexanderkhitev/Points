//
//  ListDisclosureIndicatorRow.swift
//  Points
//
//  Created by Alexander Khitev on 9/21/22.
//

import SwiftUI

struct ListDisclosureIndicatorRow<Content: View>: View {
    @ViewBuilder var content: Content
    var action: () -> Void
    var indicatorPadding: Padding?
    var backgroundColorStyle: HighlightedBackgroundButtonStyle

    init(backgroundColorStyle: HighlightedBackgroundButtonStyle =
        .init(backgroundColor: .white,
              pressedBackgroundColor: Color(UIColor.systemGray5)),
         action: @escaping () -> Void,
         indicatorPadding: Padding? = nil,
         @ViewBuilder content: () -> Content) {
        self.backgroundColorStyle = backgroundColorStyle
        self.action = action
        self.indicatorPadding = indicatorPadding
        self.content = content()
    }

    var body: some View {
        ListRowDisclocuredView(indicatorPadding: indicatorPadding) {
            row
        }
    }

    @ViewBuilder
    private var row: some View {
        ListRow(backgroundColorStyle: backgroundColorStyle, action: action) {
            content
        }
    }
}

struct ListDisclosureIndicatorRow_Previews: PreviewProvider {
    static var previews: some View {
        ListDisclosureIndicatorRow<Text>(action: { }) {
            Text("Hello")
        }
    }
}
