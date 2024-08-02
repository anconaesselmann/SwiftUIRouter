//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUIRouter

enum Route: RouteType {
    case home, detail(Int)

    enum RouteName: String {
        case home, detail
    }

    var rawValue: String {
        switch self {
        case .home: return RouteName.home.rawValue
        case .detail(let id): return "\(RouteName.detail.rawValue)/\(id)"
        }
    }

    init?(rawValue: String) {
        guard let (route, id) = Self.parts(for: rawValue) else { return nil }
        switch (RouteName(rawValue: route), id) {
        case (.home, nil): self = .home
        case (.detail, let id):
            guard let id = id, let id = Int(id) else { return nil }
            self = .detail(id)
        default: return nil
        }
    }
}
