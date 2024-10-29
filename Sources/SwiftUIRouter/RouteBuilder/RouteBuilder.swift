//  Created by Axel Ancona Esselmann on 10/16/24.
//

import Foundation

public class RouteBuilder<R> where R: RouteType {

    private enum StringToRouteRule {
        case route(routeName: String, R)
        case routeWithUUID(routeName: String, builder: (UUID) -> R)
        case routeWithDate(routeName: String, builder: (Date) -> R, format: String)

        var routeName: String {
            switch self {
            case .route(let routeName, _), .routeWithUUID(let routeName, _), .routeWithDate(let routeName, _, _):
                return routeName
            }
        }
    }

    private enum RouteToStringRule {
        case routeWithDate(routeName: String, format: String)

        var routeName: String {
            switch self {
            case .routeWithDate(let routeName, _):
                return routeName
            }
        }
    }

    private let separator: String
    private var rules: [StringToRouteRule] = []
    private var routeToStringRule: [RouteToStringRule] = []

    public var routeNames: [String] {
        rules.map { $0.routeName }
    }

    public init(separator: String = "/") {
        self.separator = separator
    }

    @discardableResult
    public func add(_ routeBuilder: @escaping (UUID) -> R) -> Self {
        let routeName = String("\(routeBuilder(UUID()))".split(separator: "(")[0])
        rules.append(.routeWithUUID(routeName: routeName, builder: routeBuilder))
        return self
    }

    @discardableResult
    public func add(
        _ routeBuilder: @escaping (Date) -> R,
        format: String = "yyyy-MM-dd"
    ) -> Self {
        let routeName = String("\(routeBuilder(Date()))".split(separator: "(")[0])
        rules.append(.routeWithDate(
            routeName: routeName,
            builder: routeBuilder,
            format: format
        ))
        routeToStringRule.append(.routeWithDate(routeName: routeName, format: format))
        return self
    }

    @discardableResult
    public func add(_ match: String, _ route: R) -> Self {
        rules.append(.route(routeName: match, route))
        return self
    }

    @discardableResult
    public func add(_ route: R) -> Self {
        rules.append(.route(routeName: "\(route)", route))
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
            case .routeWithDate(let match, let dayRouteBuilder, let format):
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = format
                if
                    routeString == match,
                    let dateString = parts.arg,
                    let date = dateFormatter.date(from: dateString)
                {
                    return dayRouteBuilder(date)
                }
            }
        }
        return nil
    }
    
    internal func _rawValue(for route: R) -> String {
        let rough = "\(route)".replacing(")", with: "").replacing("(", with: "/")
        if let rawValue = rawValue(forRoughValue: rough) {
            return rawValue
        } else {
            return rough
        }
    }

    private func rawValue(forRoughValue roughValue: String) -> String? {
        guard
            let routeName = roughValue.split(separator: separator).first,
            let rule = routeToStringRule.first(where: { $0.routeName == routeName })
        else {
            return nil
        }
        let parts = roughValue.split(separator: separator)
        switch rule {
        case .routeWithDate(routeName: let name, format: let format):
            guard
                parts.count == 2,
                let routeName = parts.first,
                let dateString = parts.last
            else {
                return nil
            }
            let dateParts = dateString.split(separator: " ")
            guard dateParts.count >= 2 else {
                return nil
            }
            let dString = dateParts[0]
            let tString = dateParts[1]
            let newFormatter = ISO8601DateFormatter()
            guard let date = newFormatter.date(from: "\(dString)T\(tString)Z") else {
                return nil
            }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            let rawDateValue = dateFormatter.string(from: date)
            return name + separator + rawDateValue
        }
    }
}
