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
        PointsChart(pointsHUB: pointsHUB)
            .frame(height: 250)
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
