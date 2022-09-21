//
//  Padding.swift
//  Points
//
//  Created by Alexander Khitev on 9/21/22.
//

import SwiftUI

struct Padding {
    let edges: Edge.Set
    let length: CGFloat?

    init(edges: Edge.Set = .all, length: CGFloat?) {
        self.edges = edges
        self.length = length
    }
}
