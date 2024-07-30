//  Created by Axel Ancona Esselmann on 7/26/24.
//

import Foundation

public struct NavigationEvent<R>: Equatable
    where R: RouteType
{
    public let route: R
    public let style: NavigationStyle
    public let activeTab: Int?

    public var withAnimation: Bool {
        style == .withAnimation
    }

    public init(route: R, style: NavigationStyle, activeTab: Int?) {
        self.route = route
        self.style = style
        self.activeTab = activeTab
    }
}

extension Int {
    init?(activeTabFor url: URL) {
        guard let activeTabString = URLComponents(string: url.absoluteString)?
            .queryItems?
            .first(where: {$0.name == "tab"} )?
            .value,
              let activeTab = Int(activeTabString)
        else {
            return nil
        }
        self = activeTab
    }
}
