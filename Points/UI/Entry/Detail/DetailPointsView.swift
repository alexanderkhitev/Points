//
//  DetailPointsView.swift
//  Points
//
//  Created by Alexander Khitev on 9/20/22.
//

import SwiftUI

struct DetailPointsView: View {
    @StateObject private var viewModel: DetailPointsViewModel

    init(viewModel: DetailPointsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailPointsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPointsView(viewModel: .init(hub: .init()))
    }
}
