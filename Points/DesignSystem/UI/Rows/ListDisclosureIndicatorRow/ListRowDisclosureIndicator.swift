//
//  ListRowDisclosureIndicator.swift
//  Points
//
//  Created by Alexander Khitev on 9/21/22.
//

import SwiftUI

struct ListRowDisclosureIndicator: View {
    let padding: Padding?

    init(padding: Padding? = nil) {
        self.padding = padding
    }

    var body: some View {
        HStack {
            Spacer()
            if let padding {
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(uiColor: .systemGray2))
                    .padding(padding.edges, padding.length)
            } else {
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(uiColor: .systemGray2))
            }
        }
    }
}

struct ListRowDisclosureIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ListRowDisclosureIndicator()
    }
}
