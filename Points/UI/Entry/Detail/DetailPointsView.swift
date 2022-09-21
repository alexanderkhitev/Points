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
        content
            .onAppear {
                viewModel.makeSections()
            }
    }

    @ViewBuilder
    private var content: some View {
        list
    }

    @ViewBuilder
    private var list: some View {
        List {
            ForEach(viewModel.listSections) { section in
                switch section {
                case .list:
                    listSection(section)
                case .graph:
                    graphSection(section)
                }
            }
        }
    }

    @ViewBuilder
    private func listSection(_ section: DetailPointsListSection) -> some View {
        Section(section.title) {
            ForEach(viewModel.hub.points) { point in
                DetailPointsListPointRow(point: point)
            }
        }
    }

    @ViewBuilder
    private func graphSection(_ section: DetailPointsListSection) -> some View {
        Section(section.title) {
            DetailPointsListGraphRow(pointsHUB: viewModel.hub) {
                
            }
        }
    }

}

struct DetailPointsView_Previews: PreviewProvider {
    static var previews: some View {
        let mockPointsHUB = PointsHUBMock.instance()
        NavigationStack {
            DetailPointsView(viewModel: .init(hub: mockPointsHUB,
                                              coordinator: .init()))
        }
    }
}
