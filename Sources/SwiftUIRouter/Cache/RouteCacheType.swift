//  Created by Axel Ancona Esselmann on 10/19/24.
//

import Foundation

public protocol RouteCacheType {
    func cache(_ route: any RouteType)
    func fetch<Route>(for routeType: Route.Type) -> Route?
        where
            Route: RouteType,
            Route: RawRepresentable,
            Route.RawValue == String
}
