//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUIRouter

enum Route: RouteType {
    case home, detail(Int)

    enum RouteName: String {
        case appLaunch, secondScreen
    }

    var rawValue: String {
        switch self {
        case .home: return RouteName.appLaunch.rawValue
        case .detail(let id): return "\(RouteName.secondScreen.rawValue)/\(id)"
        }
    }

    init?(rawValue: String) {
        guard let (route, id) = Self.parts(for: rawValue) else { return nil }
        switch (RouteName(rawValue: route), id) {
        case (.appLaunch, nil): self = .home
        case (.secondScreen, let id):
            guard let id = id, let id = Int(id) else { return nil }
            self = .detail(id)
        default: return nil
        }
    }
}
