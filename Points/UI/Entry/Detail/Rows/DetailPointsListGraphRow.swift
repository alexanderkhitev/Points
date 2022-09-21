//
//  DetailPointsListGraphRow.swift
//  Points
//
//  Created by Alexander Khitev on 9/20/22.
//

import SwiftUI
import Charts

struct DetailPointsListGraphRow: View {
    let pointsHUB: PointsHUB
    let action: () -> Void

    var body: some View {
        ListDisclosureIndicatorRow(action: action,
                                   indicatorPadding: Padding(edges: .trailing, length: 16)) {
            content
        }
        .listRowInsets(EdgeInsets())
        .contentShape(Rectangle())
    }

    @ViewBuilder
    private var content: some View {
        PointsChart(pointsHUB: pointsHUB)
            .padding()
            .frame(height: 250)
    }

}

struct DetailPointsListGraphRow_Previews: PreviewProvider {
    static var previews: some View {
        var pointsHUB = PointsHUBMock.instance()
        pointsHUB.createSortedPoints()
        return List {
            DetailPointsListGraphRow(pointsHUB: pointsHUB, action: { })
        }
    }
}
