//
//  ProgressHUDItem.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import Foundation

struct ProgressHUDItem {
    var showProgressHUD = false
    var result: Result<Void, Error>?
}

extension ProgressHUDItem: Equatable {
    static func == (lhs: ProgressHUDItem, rhs: ProgressHUDItem) -> Bool {
        lhs.showProgressHUD == rhs.showProgressHUD
    }
}
