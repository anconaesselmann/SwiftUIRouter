//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI

public struct NavigationTarget<R, Content>: NavigationTargetType
    where R: RouteType, Content: View
{
    public enum Behavior {
        case navStack, replace
    }

    private let startingRoute: R
    private let behavior: Behavior
    private let content: (R) -> Content

    public init(
        _ behavior: Behavior = .replace,
        root startingRoute: R,
        @ViewBuilder
        content: @escaping (R) -> Content
    ) {
        self.startingRoute = startingRoute
        self.behavior = behavior
        self.content = content
    }

    public var body: some View {
        switch behavior {
        case .navStack:
            NavigationStackTarget(startingRoute, content: content)
        case .replace:
            NavigationReplaceTarget(startingRoute, content: content)
        }
    }
}
