//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SwiftUIRouter

enum Route: String, CaseIterable, RouteType {
    case home, detail
}

@main
struct ExampleApp: App {

    @StateObject
    var router = Router<Route>()

    var body: some Scene {
        WindowGroup {
            NavigationTarget(root: Route.home) { route in
                switch route {
                case .home:
                    HomeView()
                case .detail:
                    DetailView()
                }
            }.use(router: router)
        }
    }
}
