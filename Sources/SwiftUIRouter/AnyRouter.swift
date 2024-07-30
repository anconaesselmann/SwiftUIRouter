//  Created by Axel Ancona Esselmann on 7/29/24.
//

import Foundation

public struct AnyRouter {

    public let anyRoute: AnyRoute

    private var onRoute: (any RouteType, NavigationStyle, Int?) -> Bool

    public init<R>(_ router: Router<R>) where R: RouteType {
        self.anyRoute = AnyRoute(R.self)
        self.onRoute = { [weak router] anyRoute, style, activeTab -> Bool in
            guard let router = router, let route = anyRoute as? R else {
                return false
            }
            router.present(route, style: style, activeTab: activeTab)
            return true
        }
    }

    public func present(
        anyRoute: any RouteType,
        style: NavigationStyle = .none,
        activeTab: Int?
    ) -> Bool {
        onRoute(anyRoute, style, activeTab)
    }
}
