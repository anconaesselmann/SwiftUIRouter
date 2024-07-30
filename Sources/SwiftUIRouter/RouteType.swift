//  Created by Axel Ancona Esselmann on 7/26/24.
//

import Foundation

public protocol RouteType: RawRepresentable, Identifiable, Hashable
    where RawValue == String
{
    var hasValue: Bool { get }
}

public extension RouteType {
    var hasValue: Bool { false }

    var id: String { rawValue }

    var componentCount: Int {
        rawValue.components(separatedBy: "/").count
    }

    static func parts(for rawValue: String) -> (route: String, arg: String?)? {
        let components = rawValue
            .components(separatedBy: "/")
            .map { String($0) }
            .filter { !$0.isEmpty }
        guard !components.isEmpty else {
            return nil
        }
        if components.count > 1 {
            return (route: components[0], arg: components[1])
        } else {
            return (route: components[0], arg: nil)
        }
    }

    static func process(_ url: URL) -> (Self, URL?)? {
        guard
            var urlComponents = URLComponents(string: url.absoluteString),
            let host = urlComponents.host
        else {
            return nil
        }
        var components = [host] + urlComponents.path.components(separatedBy: "/").filter { !$0.isEmpty }
        let path = components.joined(separator: "/")
        guard let route = Self(rawValue: path) else {
            return nil
        }
        components.removeFirst(route.componentCount)
        guard !components.isEmpty else {
            return (route, nil)
        }
        let newHost = components.removeFirst()
        urlComponents.host = newHost
        urlComponents.path = "/" + components.joined(separator: "/")
        guard let newUrl = urlComponents.url else {
            return (route, nil)
        }
        return (route, newUrl)
    }
}

public extension RouteType where Self: CaseIterable {
    init?(rawValue: String) {
        let routeString = Self.parts(for: rawValue)?.route
        for route in Self.allCases {
            if route.rawValue == routeString {
                self = route
                return
            }
        }
        return nil
    }
}
