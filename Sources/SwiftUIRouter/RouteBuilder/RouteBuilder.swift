//  Created by Axel Ancona Esselmann on 10/16/24.
//

import Foundation

public class RouteBuilder<R> where R: RouteType {

    private enum Rule {
        case route(String, R)
        case routeWithUUID(String, (UUID) -> R)

        var routeName: String {
            switch self {
            case .route(let routeName, _), .routeWithUUID(let routeName, _):
                return routeName
            }
        }
    }

    private let separator: String
    private var rules: [Rule] = []

    public var routeNames: [String] {
        rules.map { $0.routeName }
    }

    public init(separator: String = "/") {
        self.separator = separator
    }

    @discardableResult
    public func add(_ routeBuilder: @escaping (UUID) -> R) -> Self {
        let routeName = String("\(routeBuilder(UUID()))".split(separator: "(")[0])
        rules.append(.routeWithUUID(routeName, routeBuilder))
        return self
    }

    @discardableResult
    public func add(_ match: String, _ route: R) -> Self {
        rules.append(.route(match, route))
        return self
    }

    @discardableResult
    public func add(_ route: R) -> Self {
        rules.append(.route("\(route)", route))
        return self
    }

    public func build(_ rawValue: String) -> R? {
        guard let parts = R.parts(for: rawValue) else {
            return nil
        }
        let routeString = parts.route
        for rule in rules {
            switch rule {
            case .route(let match, let route):
                if routeString == match {
                    return route
                }
            case .routeWithUUID(let match, let urlRouteBuilder):
                if routeString == match, let uuid = parts.arg?.uuid {
                    return urlRouteBuilder(uuid)
                }
            }
        }
        return nil
    }
}
