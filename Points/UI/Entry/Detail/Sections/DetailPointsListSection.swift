//
//  DetailPointsListSection.swift
//  Points
//
//  Created by Alexander Khitev on 9/20/22.
//

import Foundation

enum DetailPointsListSection: Hashable, Identifiable, CaseIterable {
    var id: Self { self }

    case list
    case graph

    var title: String {
        switch self {
        case .graph:
            return "Graph"
        case .list:
            return "List"
        }
    }
}
