//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI

public struct NavigationStackTarget<R, Content>: View
    where R: RouteType, Content: View
{
    @EnvironmentObject
    private var router: Router<R>

    private var content: (R) -> Content

    public init(_ startingRoute: R, @ViewBuilder content: @escaping (R) -> Content) {
        self.startingRoute = startingRoute
        self.path = []
        self.content = content
    }

    @State
    private var path: [R] = []

    @State
    private var startingRoute: R

    public var body: some View {
        NavigationStack(path: $path) {
            content(startingRoute)
                .navigationDestination(for: R.self) { route in
                    content(route)
                }
        }
        .onReceive(router.event) { event in
            self.path.append(event.route)
        }
    }
}
