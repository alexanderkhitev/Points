//
//  String.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import Foundation

extension String {
    func allowedOnlyPositiveNumbers() -> String {
        do {
            let regex = try Regex("^[1-9][0-9]*$")
            guard let match = wholeMatch(of: regex) else { return "" }
            let result = String(match.0)
            return result
        } catch {
            debugPrint("positiveNumberRegex \(error)")
            return ""
        }
    }
}
