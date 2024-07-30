//  Created by Axel Ancona Esselmann on 7/27/24.
//

import SwiftUI

public struct NavigationTargetView<R, Content>: View
    where R: RouteType, Content: View
{
    @EnvironmentObject
    private var router: Router<R>

    private var content: (R) -> Content

    public init(_ startingRoute: R, @ViewBuilder content: @escaping (R) -> Content) {
        self.route = startingRoute
        self.content = content
    }

    @State
    private var route: R

    public var body: some View {
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
