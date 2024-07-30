//  Created by Axel Ancona Esselmann on 7/29/24.
//

import Foundation

public extension Array where Element == AnyRouter {
    func route(_ url: URL) {
        let routeTypes = self.map { $0.anyRoute }
        let routes = url.routes(for: routeTypes)
        let style = NavigationStyle(url)
        let activeTab = Int(activeTabFor: url)
        for route in routes {
            for router in self {
                if style == .modal {
                    if router.present(anyRoute: route, style: style, activeTab: activeTab) {
                        return
                    }
                } else {
                    if router.present(anyRoute: route, style: style, activeTab: activeTab) {
                        break
                    }
                }
            }
        }
    }
}


