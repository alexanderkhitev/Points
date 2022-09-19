//
//  EntryViewModel.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import Foundation

final class EntryViewModel: ObservableObject {
    @Published var textFieldValue: Int?

    let textFieldFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }()

    init() {
        debugPrint("[a]: EntryViewModel init")
    }

    deinit {
        debugPrint("[a]: EntryViewModel deinit")
    }

}
