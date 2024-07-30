//  Created by Axel Ancona Esselmann on 7/29/24.
//

import Foundation

public extension URL {
    func routes(for anyRoutes: [AnyRoute]) -> [any RouteType] {
        var routes: [any RouteType] = []
        var url: URL? = self
        while url != nil {
            guard let currentUrl = url else {
                break
            }
            var routed = false
            for anyRoute in anyRoutes {
                if let (route, newUrl) = anyRoute.process(currentUrl) {
                    url = newUrl
                    routes.append(route)
                    routed = true
                    break
                }
            }
            guard routed else {
                return routes
            }
        }
        return routes
    }

    func route<T1>(for t1: T1.Type) -> T1?
        where T1: RouteType
    {
        guard let (route, _) = T1.process(self) else {
            return nil
        }
        return route
    }
    
    func withQueryParameter(key: String, value: String) -> URL? {
        guard var components = URLComponents(string: self.absoluteString) else {
            return nil
        }
        var query = components.queryItems ?? []
        var found = false
        for queryIndex in 0..<query.count {
            var item = query[queryIndex]
            if item.name == "style" {
                item.value = value
                query[queryIndex] = item
                found = true
                break
            }
        }
        if !found {
            query.append(URLQueryItem(name: "style", value: value))
        }
        components.queryItems = query
        return components.url
    }
}
