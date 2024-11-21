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
    private var tag: Int?

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
            NavigationStackTarget(
                startingRoute,
                tag: tag,
                content: content
            )
        case .replace:
            NavigationReplaceTarget(
                startingRoute,
                tag: tag,
                content: content
            )
        }
    }

    public func tab(_ tagValue: Int) -> some View {
        var copy = self
        copy.tag = tagValue
        return copy.tag(tagValue)
    }

    public func tab<V>(
        _ tagValue: Int,
        @ViewBuilder _ label: () -> V
    ) -> some View where V : View {
        var copy = self
        copy.tag = tagValue
        return copy
            .tag(tagValue)
            .tabItem(label)
    }

    public func tab(_ tag: any TabType) -> some View {
        tab(tag.rawValue)
    }

    public func tab<V>(
        _ tag: any TabType,
        @ViewBuilder _ label: @escaping () -> V
    ) -> some View where V : View {
        RouterEnvironmentAccess { environment in
            tab(tag.rawValue, label)
                .environment(\.routerEnvironment, environment.reduced(RouterEnvironment(tag: tag)))
        }
    }
}
