//
//  PointsHUBMock.swift
//  Points
//
//  Created by Alexander Khitev on 9/20/22.
//

import Foundation

struct PointsHUBMock {
    static func instance() -> PointsHUB {
        var points = [Point]()
        for _ in 0..<100 {
            let point = Point(x: .random(in: -1000...999),
                              y: .random(in: -1000...999))
            points.append(point)
        }
        return PointsHUB(points)
    }
}
