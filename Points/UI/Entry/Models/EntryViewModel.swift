//
//  EntryViewModel.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import Foundation
import Combine

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

    init() {
        addTextFieldValueSubscriber()
    }

    private func addTextFieldValueSubscriber() {
        $textFieldValue
            .removeDuplicates()
            .sink { [weak self] numberString in
                self?.didUpdateInput(numberString)
                debugPrint("[a]: text field value: \(numberString)")
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
        hudItem.showProgressHUD = true
        Task(priority: .background) {
            do {
                let hub = try await api.requestPoints(pointsNumber)
                await MainActor.run(body: {
                    hudItem = .init(showProgressHUD: false, result: .success(()))
                })
            } catch {
                await MainActor.run(body: {
                    hudItem = .init(showProgressHUD: false, result: .failure(error))
                })
            }
        }
    }
}
