//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI

internal struct NavigationStackTarget<R, Content>: NavigationTargetType
    where R: RouteType, Content: View
{
    @EnvironmentObject
    private var router: Router<R>

    @EnvironmentObject
    private var appRouter: AppRouter

    private var content: (R) -> Content
    private var tag: Int?

    internal init(
        _ startingRoute: R,
        tag: Int?,
        @ViewBuilder
        content: @escaping (R) -> Content
    ) {
        self.startingRoute = startingRoute
        self.path = []
        self.content = content
        self.tag = tag
    }

    @State
    private var path: [R] = []

    @State
    private var startingRoute: R

    internal var body: some View {
        NavigationStack(path: $path) {
            content(startingRoute)
                .navigationDestination(for: R.self) { route in
                    content(route)
                }
        }
        .onReceive(router.event) { event in
            if let activeTag = event.activeTab, activeTag != tag {
                return
            }
            guard path.last != event.route else {
                return
            }
            if event.route == startingRoute {
                path = []
            } else if let index = path.firstIndex(where: { $0 == event.route }) {
                // Todo: possible to not...
                path = Array(path[0...index])
            } else {
                path.append(event.route)
            }
        }
        // Attempted fix:
        // Back navigation on tab view would not persist across tab changes
        .onChange(of: path) { oldValue, newValue in
            if oldValue.count > newValue.count {
                let route = newValue.last ?? startingRoute
                router._updateEvent(route, style: .none, activeTab: tag)
            }
        }
    }
}
