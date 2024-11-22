//  Created by Axel Ancona Esselmann on 7/28/24.
//

import SwiftUI
import SwiftUIRouter
import Routes
import Detail
import Content
import Sidebar
import Root

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
                    .toolbar {
                        AddressBar().frame(width: 400)
                    }
            }
            .use(routers: rootRouter, sidebarRouter, contentRouter, detailRouter)
        }
    }
}
