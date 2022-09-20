//
//  AppView.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var coordinator: AppCoordinator

    // TODO: - Alex improve it
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            EntryView(viewModel: .init(coordinator))
                .navigationDestination(for: MainRoute.self) { route in
                    switch route {
                    case .detail(let pointsHub):
                        DetailPointsView(viewModel: .init(hub: pointsHub))
                    }
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(AppCoordinator())
    }
}
