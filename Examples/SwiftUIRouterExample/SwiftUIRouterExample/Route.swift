//  Created by Axel Ancona Esselmann on 7/29/24.
//

import Foundation
import SwiftUIRouter

enum RootRoute: String, RouteType, CaseIterable {
    case test1, test2
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

extension URL {
    init?(appUrl path: String) {
        self.init(string: "example://\(path)")
    }

    init?<R>(_ route: R) where R: RouteType {
        self.init(appUrl: route.rawValue)
    }
}

extension URL {
    struct root {
        static let test1 = URL(RootRoute.test1)
        static let test2 = URL(RootRoute.test2)
    }

    struct content {
        static let a = URL(ContentRoute.contentA)
        static let b = URL(ContentRoute.contentB)
        static let c = URL(ContentRoute.contentC)
    }

    struct detail {
        static func a(_ value: String) -> URL? {
            URL(DetailRoute.detailA(value))
        }
        static func b(_ value: String) -> URL? {
            URL(DetailRoute.detailB(value))
        }
        static func c(_ value: String) -> URL? {
            URL(DetailRoute.detailC(value))
        }
    }
}
