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

    internal init(_ startingRoute: R, @ViewBuilder content: @escaping (R) -> Content) {
        self.route = startingRoute
        self.content = content
    }

    @State
    private var route: R

    internal var body: some View {
        content(route)
            .onReceive(router.event) { event in
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
