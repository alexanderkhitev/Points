//
//  Point.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import Foundation

struct Point: Codable, Hashable, Identifiable {
    let id: UUID
    let x: CGFloat
    let y: CGFloat

    enum CodingKeys: CodingKey, CaseIterable {
        case x
        case y
    }

    init(x: CGFloat, y: CGFloat) {
        id = UUID()
        self.x = x
        self.y = y
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = UUID()
        x = try container.decode(CGFloat.self, forKey: .x)
        y = try container.decode(CGFloat.self, forKey: .y)
    }
}
