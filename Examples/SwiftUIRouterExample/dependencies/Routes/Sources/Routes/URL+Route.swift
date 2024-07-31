//  Created by Axel Ancona Esselmann on 7/30/24.
//

import Foundation
import SwiftUIRouter

public extension URL {
    init?(appUrl path: String) {
        self.init(string: "example://\(path)")
    }

    init?<R>(_ route: R) where R: RouteType {
        self.init(appUrl: route.rawValue)
    }
}

public extension URL {
    struct root {
        public static let stack = URL(RootRoute.stack)
        public static let split = URL(RootRoute.split)
        public static let tab = URL(RootRoute.tab)
    }

    struct sidebar {
        public static let buttons = URL(SidebarRoute.buttonSidebar)
        public static let markdown = URL(SidebarRoute.markdownSidebar)
    }

    struct content {
        public static let a = URL(ContentRoute.contentA)
        public static let b = URL(ContentRoute.contentB)
        public static let c = URL(ContentRoute.contentC)
    }

    struct detail {
        public static func a(_ value: String) -> URL? {
            URL(DetailRoute.detailA(value))
        }
        public static func b(_ value: String) -> URL? {
            URL(DetailRoute.detailB(value))
        }
        public static func c(_ value: String) -> URL? {
            URL(DetailRoute.detailC(value))
        }
    }
}
