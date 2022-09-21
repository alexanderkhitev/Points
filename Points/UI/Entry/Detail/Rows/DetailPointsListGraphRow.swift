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

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                Chart(pointsHUB.sortedPoints) { point in
                    LineMark(x: .value("x", point.x),
                             y: .value("y", point.y))
                    .lineStyle(.init(lineWidth: 3,
                                     lineCap: .round,
                                     lineJoin: .round))
                    .interpolationMethod(.catmullRom)
                    .symbol(.circle)
                }
                .frame(minWidth: max(CGFloat(pointsHUB.sortedPoints.count) * 10, geometry.size.width))
                .padding([.vertical, .trailing])
            }
        }
        .frame(height: 300)
    }
}

struct DetailPointsListGraphRow_Previews: PreviewProvider {
    static var previews: some View {
        var pointsHUB = PointsHUBMock.instance()
        pointsHUB.createSortedPoints()

        return List {
            DetailPointsListGraphRow(pointsHUB: pointsHUB)
        }
    }
}
