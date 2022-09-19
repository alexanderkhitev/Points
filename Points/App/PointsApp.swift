//
//  PointsApp.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import SwiftUI

@main
struct PointsApp: App {
    @StateObject private var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            AppView()
                .environmentObject(coordinator)
        }
    }
}
