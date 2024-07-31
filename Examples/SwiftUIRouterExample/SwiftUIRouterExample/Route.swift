//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUIRouter

enum RootRoute: String, RouteType, CaseIterable {
    case stack, split, tab
}

enum SidebarRoute: String, RouteType, CaseIterable {
    case sidebarA
}

enum ContentRoute: String, RouteType, CaseIterable {
    case contentA, contentB, contentC
}

enum DetailRoute: RouteType {
    case detailA(String), detailB(String), detailC(String)

    enum RouteNames: String { case detailA, detailB, detailC }

    var rawValue: String {
        switch self {
        case .detailA(let value):
            return "\(RouteNames.detailA.rawValue)/\(value)"
        case .detailB(let value):
            return "\(RouteNames.detailB.rawValue)/\(value)"
        case .detailC(let value):
            return "\(RouteNames.detailC.rawValue)/\(value)"
        }
    }

    init?(rawValue: String) {
        guard
            let (route, value) = Self.parts(for: rawValue),
            let value = value
        else {
            return nil
        }
        switch route {
        case RouteNames.detailA.rawValue: self = .detailA(value)
        case RouteNames.detailB.rawValue: self = .detailB(value)
        case RouteNames.detailC.rawValue: self = .detailC(value)
        default: return nil
        }
    }
}
