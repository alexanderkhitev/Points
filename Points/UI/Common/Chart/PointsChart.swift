//
//  PointsChart.swift
//  Points
//
//  Created by Alexander Khitev on 9/21/22.
//

import Charts
import SwiftUI

struct PointsChart: View {
    let pointsHUB: PointsHUB

    var body: some View {
        Chart(pointsHUB.sortedPoints) { point in
            LineMark(x: .value("x", point.x),
                     y: .value("y", point.y))
            .lineStyle(.init(lineWidth: 3,
                             lineCap: .round,
                             lineJoin: .round))
            .interpolationMethod(.catmullRom)
            .symbol(.circle)
        }
    }
}

struct PointsChart_Previews: PreviewProvider {
    static var previews: some View {
        PointsChart(pointsHUB: .init())
    }
}
