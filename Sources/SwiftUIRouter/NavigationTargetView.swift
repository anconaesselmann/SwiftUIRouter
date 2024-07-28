//  Created by Axel Ancona Esselmann on 7/27/24.
//

import SwiftUI

public struct NavigationTargetView<R, T, Content>: View
    where R: RouteType, Content: View, T: NavigationTarget
{
    @EnvironmentObject
    private var router: Router<R, T>

    private var content: (R) -> Content

    private let target: T

    public init(listenFor target: T, @ViewBuilder content: @escaping (R) -> Content) {
        self.content = content
        self.target = target
    }

    @State
    private var route: R?

    public var body: some View {
        VStack {
            if let route = route {
                content(route)
            }
        }.onReceive(router.event
            .filter { $0.target == target }
        ) { event in
            if event.withAnimation {
                withAnimation {
                    self.route = route
                }
            } else {
                self.route = event.route
            }
        }
    }
}

