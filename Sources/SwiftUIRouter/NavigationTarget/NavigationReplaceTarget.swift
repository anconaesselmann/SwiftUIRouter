//  Created by Axel Ancona Esselmann on 7/27/24.
//

import SwiftUI

internal struct NavigationReplaceTarget<R, Content>: NavigationTargetType
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
        self.route = startingRoute
        self.content = content
        self.tag = tag
    }

    @State
    private var route: R

    internal var body: some View {
        content(route)
            .onReceive(router.event) { event in
                if let activeTag = event.activeTab, activeTag != tag {
                    return
                }
                if event.withAnimation {
                    withAnimation {
                        self.route = event.route
                    }
                } else {
                    self.route = event.route
                }
            }
    }
}
