//
//  AppView.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var coordinator: AppCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            EntryView()
                .navigationDestination(for: MainRoute.self) { route in

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
