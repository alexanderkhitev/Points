//
//  Coordinator.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import Foundation
import SwiftUI

protocol Coordinator: ObservableObject {
    associatedtype Route: Hashable
    var path: NavigationPath { get set }
    func show(_ route: Route)
    func popToRoot()
}

extension Coordinator {
    func popToRoot() {
        path.removeLast(path.count-1)
    }
}
