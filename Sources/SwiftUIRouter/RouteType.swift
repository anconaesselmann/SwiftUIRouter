//  Created by Axel Ancona Esselmann on 7/26/24.
//

import Foundation

public protocol RouteType: Equatable, Identifiable {
    init?(_ url: URL)
}

extension NavigationEvent {
    init?(_ url: URL) {
        guard let route = R(url) else {
            return nil
        }
        let target = T(url) ?? T.default
        self.init(route: route, target: target, withAnimation: false)
    }
}
