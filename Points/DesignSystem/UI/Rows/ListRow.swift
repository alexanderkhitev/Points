//
//  ListRow.swift
//  Points
//
//  Created by Alexander Khitev on 9/21/22.
//

import SwiftUI

struct ListRow<Content: View>: View {
    var action: () -> Void
    @State private var isSelected = false
    var backgroundColorStyle: HighlightedBackgroundButtonStyle
    @ViewBuilder private(set) var content: Content

    init(backgroundColorStyle: HighlightedBackgroundButtonStyle =
        .init(backgroundColor: .white,
              pressedBackgroundColor: Color(.systemGray5)),
         action: @escaping () -> Void,
         @ViewBuilder content: () -> Content) {
        self.backgroundColorStyle = backgroundColorStyle
        self.action = action
        self.content = content()
    }

    var body: some View {
        Button {
            action()
            isSelected.toggle()
        } label: {
            content
        }
        .onAppear {
            isSelected = false
        }
        .contentShape(Rectangle())
        .buttonStyle(
            HighlightedBackgroundButtonStyle(
                backgroundColor: isSelected ?
                backgroundColorStyle.pressedBackgroundColor : backgroundColorStyle.backgroundColor,
                pressedBackgroundColor: backgroundColorStyle.pressedBackgroundColor)
        )
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        return ListRow(action: {} ) {
            Text("Hello")
                .foregroundColor(.gray)
                .contentShape(Rectangle())
        }
    }
}
