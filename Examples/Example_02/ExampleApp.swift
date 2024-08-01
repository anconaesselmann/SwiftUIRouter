//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SwiftUIRouter

@main
struct ExampleApp: App {

    @StateObject
    var router = Router<Route>()

    var body: some Scene {
        WindowGroup {
            NavigationTarget(.navStack, root: Route.home, content: ViewFactory.init)
                .use(router: router)
        }
    }
}

struct ViewFactory: View {

    let route: Route
    
    var body: some View {
        switch route {
        case .home:
            HomeView()
        case .detail(let id):
            DetailView(id: id)
        }
    }
}
