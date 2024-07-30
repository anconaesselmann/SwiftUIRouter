//  Created by Axel Ancona Esselmann on 7/28/24.
//

import SwiftUI
import SwiftUIRouter

typealias RootRouter = Router<RootRoute>
typealias SidebarRouter = Router<SidebarRoute>
typealias ContentRouter = Router<ContentRoute>
typealias DetailRouter = Router<DetailRoute>

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
                .environmentObject(rootRouter)
                .environmentObject(sidebarRouter)
                .environmentObject(contentRouter)
                .environmentObject(detailRouter)

                .handlesExternalEvents(
                    preferring: ["example"],
                    allowing: ["example"]
                )
                .onOpenURL(perform: { url in
                    [
                        rootRouter.asAnyRouter(),
                        sidebarRouter.asAnyRouter(),
                        contentRouter.asAnyRouter(),
                        detailRouter.asAnyRouter()
                    ]
                    .route(url)
                })
                .sheet(
                    item: Binding(
                        get: { detailRouter.modal },
                        set: { detailRouter.modal = $0 }
                    ),
                    content: { route in
                        Modal {
                            DetailFactory(route: route)
                        }
                    }
                )
        }
    }
}
