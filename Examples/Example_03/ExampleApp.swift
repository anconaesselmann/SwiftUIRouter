//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SwiftUIRouter

@main
struct ExampleApp: App {

    @StateObject
    var rootRouter = Router<RootRoute>()

    var body: some Scene {
        WindowGroup {
            NavigationTarget(
                root: RootRoute.loggedOut,
                content: RootViewFactory.init
            )
            .use(router: rootRouter)
        }
    }
}
