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
    // Store properties
    private var anyCancelleble: Set<AnyCancellable> = []

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
        let number = Int(input)
        if let number {
            isValidNumber = 1...1000 ~= number
        } else {
            isValidNumber = false
        }
    }
}
