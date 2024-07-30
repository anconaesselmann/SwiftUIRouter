//  Created by Axel Ancona Esselmann on 7/28/24.
//

import SwiftUI
import SwiftUIRouter

typealias RootRouter = Router<RootRoute>
typealias SidebarRouter = Router<SidebarRoute>
typealias ContentRouter = Router<ContentRoute>
typealias DetailRouter = Router<DetailRoute>

enum AppLink: String {
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
            NavigationTargetView(RootRoute.test1, content: RootFactory.init)
                .onDeeplink(
                    with: AppLink.example.rawValue,
                    use: rootRouter, sidebarRouter, contentRouter, detailRouter
                )
                .presentModal(for: detailRouter) { route in
                    Modal {
                        DetailFactory(route: route)
                    }
                }
                .presentModal(for: contentRouter) { route in
                    Modal {
                        ContentFactory(route: route)
                    }
                }
        }
    }
}
