//
//  DetailPointsListPointRow.swift
//  Points
//
//  Created by Alexander Khitev on 9/20/22.
//

import SwiftUI

struct DetailPointsListPointRow: View {
    let point: Point

    var body: some View {
        VStack(alignment: .leading) {
            Text("X: \(point.x.description)")
            Text("Y: \(point.y.description)")
        }
    }
}

struct DetailPointsListPointRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailPointsListPointRow(point: Point(x: 50.32, y: 73.876))
    }
}
