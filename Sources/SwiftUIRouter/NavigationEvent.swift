//  Created by Axel Ancona Esselmann on 7/26/24.
//

import Foundation

public struct NavigationEvent<R>: Equatable
    where R: RouteType
{
    public let route: R
    public let style: NavigationStyle

    public var withAnimation: Bool {
        style == .withAnimation
    }

    public init(route: R, style: NavigationStyle) {
        self.route = route
        self.style = style
    }
}
