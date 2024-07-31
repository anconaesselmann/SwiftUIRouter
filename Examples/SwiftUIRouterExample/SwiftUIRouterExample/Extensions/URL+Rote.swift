//  Created by Axel Ancona Esselmann on 7/30/24.
//

import Foundation
import SwiftUIRouter

extension URL {
    init?(appUrl path: String) {
        self.init(string: "example://\(path)")
    }

    init?<R>(_ route: R) where R: RouteType {
        self.init(appUrl: route.rawValue)
    }
}

extension URL {
    struct root {
        static let stack = URL(RootRoute.stack)
        static let split = URL(RootRoute.split)
        static let tab = URL(RootRoute.tab)
    }

    struct sidebar {
        static let buttons = URL(SidebarRoute.buttonSidebar)
        static let markdown = URL(SidebarRoute.markdownSidebar)
    }

    struct content {
        static let a = URL(ContentRoute.contentA)
        static let b = URL(ContentRoute.contentB)
        static let c = URL(ContentRoute.contentC)
    }

    struct detail {
        static func a(_ value: String) -> URL? {
            URL(DetailRoute.detailA(value))
        }
        static func b(_ value: String) -> URL? {
            URL(DetailRoute.detailB(value))
        }
        static func c(_ value: String) -> URL? {
            URL(DetailRoute.detailC(value))
        }
    }
}
