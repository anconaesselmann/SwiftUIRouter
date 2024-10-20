//  Created by Axel Ancona Esselmann on 10/19/24.
//

import Foundation

public class RouteCache: RouteCacheType {
    public static let shared: RouteCacheType = RouteCache()

    public func cache(_ route: any RouteType) {
        UserDefaults.standard.setValue(route.rawValue, forKey: "\(type(of: route))")
    }

    public func fetch<Route>(for routeType: Route.Type) -> Route?
        where
            Route: RouteType,
            Route: RawRepresentable,
            Route.RawValue == String
    {
        guard
            let stringValue = UserDefaults.standard.string(forKey: "\(routeType)"),
            let route = Route(rawValue: stringValue)
        else {
            return nil
        }
        return route
    }
}
