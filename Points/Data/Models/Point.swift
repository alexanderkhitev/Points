//
//  Point.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import Foundation

struct Point: Codable, Hashable, Identifiable {
    let id: UUID
    let x: Double
    let y: Double

    enum CodingKeys: CodingKey, CaseIterable {
        case x
        case y
    }

    init(x: Double, y: Double) {
        id = UUID()
        self.x = x
        self.y = y
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        x = try container.decode(Double.self, forKey: .x)
        y = try container.decode(Double.self, forKey: .y)
    }
}
