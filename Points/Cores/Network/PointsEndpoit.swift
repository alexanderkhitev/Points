//
//  PointsAPI.swift
//  Points
//
//  Created by Alexander Khitev on 9/19/22.
//

import Moya
import Foundation

enum PointsEndpoit {
    case points(count: Int)
}

extension PointsEndpoit: TargetType {
    var baseURL: URL {
        URL(string: "https://hr-challenge.interactivestandard.com/api/test")!
    }

    var path: String {
        switch self {
        case .points:
            return "/points"
        }
    }

    var method: Moya.Method {
        switch self {
        case .points:
            return .get
        }
    }

    var task: Moya.Task {
        switch self {
        case .points(let count):
            return .requestParameters(parameters: ["count": count], encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        switch self {
        case .points:
            return nil
        }
    }

}
