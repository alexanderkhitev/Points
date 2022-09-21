//
//  EntryViewModel.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import Foundation
import Combine
import SwiftUI

final class EntryViewModel: ObservableObject {
    @Published var textFieldValue = ""
    @Published var isValidNumber = false
    @Published var hudItem = ProgressHUDItem()
    // Store properties
    private var anyCancelleble: Set<AnyCancellable> = []
    // Networking
    private lazy var api = PointsAPI()
    // Networking properties
    private var pointsNumber: Int?
    private let coordinator: AppCoordinator

    init(_ coordinator: AppCoordinator) {
        self.coordinator = coordinator
        addTextFieldValueSubscriber()
    }

    private func addTextFieldValueSubscriber() {
        $textFieldValue
            .removeDuplicates()
            .sink { [weak self] numberString in
                self?.didUpdateInput(numberString)
            }.store(in: &anyCancelleble)
    }

    private func didUpdateInput(_ input: String) {
        let pointsNumber = Int(input)
        if let pointsNumber {
            isValidNumber = 1...1000 ~= pointsNumber
        } else {
            isValidNumber = false
        }
        self.pointsNumber = pointsNumber
    }
}

// MARK: - Requests

extension EntryViewModel {
    func requestPoints() {
        guard let pointsNumber else { return }
        hudItem = .init(showProgressHUD: true)
        Task(priority: .background) {
            let hubTask = Task {
                var hub = try await api.requestPoints(pointsNumber)
                hub.createSortedPoints()
                return hub
            }
            let result = await hubTask.result
            switch result {
            case .success(let hub):
                await MainActor.run(body: {
                    hudItem = .init(showProgressHUD: false, result: .success(()))
                    coordinator.show(.detail(pointsHUB: hub))
                })
            case .failure(let error):
                await MainActor.run(body: {
                    hudItem = .init(showProgressHUD: false, result: .failure(error))
                })
            }
        }
    }

}
