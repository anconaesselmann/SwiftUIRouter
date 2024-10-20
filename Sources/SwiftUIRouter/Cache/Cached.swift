//  Created by Axel Ancona Esselmann on 10/19/24.
//

import SwiftUI

public struct Cached<Route, Content>: View
    where
        Route: RouteType,
        Route: RawRepresentable,
        Route.RawValue == String,
        Content: View
{

    private let content: () -> Content

    public init(
        _ route: Route,
        _ cache: RouteCacheType? = nil,
        @ViewBuilder
        content: @escaping () -> Content
    ) {
        RouteCache.shared.cache(route)
        self.content = content
    }

    public var body: some View {
        content()
    }
}
