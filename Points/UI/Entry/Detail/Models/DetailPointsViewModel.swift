//
//  DetailPointsViewModel.swift
//  Points
//
//  Created by Alexander Khitev on 9/20/22.
//

import Foundation
import SwiftUI

final class DetailPointsViewModel: ObservableObject {
    @Published var listSections = [DetailPointsListSection]()
    @Published var hub: PointsHUB
    // coordinator
    private let coordinator: AppCoordinator

    init(hub: PointsHUB, coordinator: AppCoordinator) {
        self.hub = hub
        self.coordinator = coordinator
    }

    func makeSections() {
        listSections = DetailPointsListSection.allCases
    }

}
