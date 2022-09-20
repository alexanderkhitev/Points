//
//  DetailPointsListGraphRow.swift
//  Points
//
//  Created by Alexander Khitev on 9/20/22.
//

import SwiftUI

struct DetailPointsListGraphRow: View {
    let pointsHUB: PointsHUB

    var body: some View {
        Text("")
    }
}

struct DetailPointsListGraphRow_Previews: PreviewProvider {
    static var previews: some View {
        let pointsHUB = PointsHUBMock.instance()
        DetailPointsListGraphRow(pointsHUB: pointsHUB)
    }
}
