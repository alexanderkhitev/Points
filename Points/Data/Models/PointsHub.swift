//
//  PointsHub.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import Foundation

struct PointsHUB: Codable {
    let id: UUID
    let points: [Point]
    var sortedPoints: [Point] = []

    enum CodingKeys: CodingKey, CaseIterable {
        case points
    }

    init(_ points: [Point] = []) {
        id = UUID()
        self.points = points
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        points = try container.decodeIfPresent([Point].self, forKey: .points) ?? []
    }

    mutating func createSortedPoints() {
        sortedPoints = points.sorted(by: { $0.x < $1.x })
    }
}

extension PointsHUB: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension PointsHUB: Identifiable {
    static func == (lhs: PointsHUB, rhs: PointsHUB) -> Bool {
        lhs.id == rhs.id
    }
}
