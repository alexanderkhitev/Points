//
//  ListRowDisclocuredView.swift
//  Points
//
//  Created by Alexander Khitev on 9/21/22.
//

import SwiftUI

struct ListRowDisclocuredView<Content: View>: View {
    @ViewBuilder var content: Content
    var indicatorPadding: Padding?

    init(indicatorPadding: Padding? = nil, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.indicatorPadding = indicatorPadding
    }

    var body: some View {
        ZStack {
            content
            ListRowDisclosureIndicator(padding: indicatorPadding)
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowDisclocuredView<Text> {
            Text("Hello")
        }
    }
}
