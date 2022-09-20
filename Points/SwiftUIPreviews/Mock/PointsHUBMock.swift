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
        for _ in 0...Int.random(in: 1...999) {
            let point = Point(x: .random(in: -10_000...9_999), y: .random(in: -10_000...9_999))
            points.append(point)
        }
        return PointsHUB(points)
    }
}
