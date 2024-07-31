//  Created by Axel Ancona Esselmann on 7/28/24.
//

import SwiftUI
import SwiftUIRouter

typealias RootRouter = Router<RootRoute>
typealias SidebarRouter = Router<SidebarRoute>
typealias ContentRouter = Router<ContentRoute>
typealias DetailRouter = Router<DetailRoute>

enum AppLink: String, CaseIterable {
    case example
}

@main
struct SwiftUIRouterExampleApp: App {

    @StateObject
    var rootRouter = RootRouter()
    @StateObject
    var sidebarRouter = SidebarRouter()
    @StateObject
    var contentRouter = ContentRouter()
    @StateObject
    var detailRouter = DetailRouter()

    var body: some Scene {
        WindowGroup {
            DeeplinkView(AppLink.self) {
                NavigationTarget(root: RootRoute.tab, content: RootFactory.init)
                    .modal(for: detailRouter) { route in
                        Modal {
                            DetailFactory(route: route)
                        }
                    }
                    .modal(for: contentRouter) { route in
                        Modal {
                            ContentFactory(route: route)
                        }
                    }
                    .modal(for: rootRouter) { route in
                        Modal {
                            RootFactory(route: route)
                        }
                    }
            }.use(routers: rootRouter, sidebarRouter, contentRouter, detailRouter)
        }
    }
}
