//
//  AppCoordinator.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import Foundation
import SwiftUI

class AppCoordinator: Coordinator {
    typealias Route = MainRoute

    @Published var path: NavigationPath

    init(path: NavigationPath = .init()) {
        self.path = path
    }

    func show(_ route: MainRoute) {
        path.append(route)
    }
}
