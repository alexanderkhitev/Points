//
//  DetailPointsViewModel.swift
//  Points
//
//  Created by Alexander Khitev on 9/20/22.
//

import Foundation
import SwiftUI

final class DetailPointsViewModel: ObservableObject {
    @Published var hub: PointsHUB

    init(hub: PointsHUB) {
        self.hub = hub
    }

}
