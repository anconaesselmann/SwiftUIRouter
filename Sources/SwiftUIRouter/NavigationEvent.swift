//  Created by Axel Ancona Esselmann on 7/26/24.
//

import Foundation

public struct NavigationEvent<R, T>
    where R: RouteType, T: NavigationTarget
{
    public let route: R
    public let target: T
    public let withAnimation: Bool

    public init(route: R, target: T, withAnimation: Bool = false) {
        self.route = route
        self.target = target
        self.withAnimation = withAnimation
    }
}
