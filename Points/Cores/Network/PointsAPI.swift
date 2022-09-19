//
//  PointsAPI.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import Foundation
import Moya

class PointsAPI {
    // Moya 15.0.3 doesn't support async await so I make this implementation
    private let provider = MoyaProvider<PointsEndpoit>()

    func requestPoints(_ pointsNumber: Int) async throws -> PointsHUB {
        try await withCheckedThrowingContinuation({ continuation in
            provider.request(.points(count: pointsNumber)) { result in
                switch result {
                case .success(let response):
                    do {
                        let hub = try response.map(PointsHUB.self)
                        continuation.resume(returning: hub)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        })
    }
}
