//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI
import Routes
import SwiftUIRouter

public struct RootFactory: View {

    private let route: RootRoute

    public init(route: RootRoute) {
        self.route = route
    }

    public var body: some View {
        switch route {
        case .stack:
            StackRootView()
        case .split:
            SplitRootView()
        case .tab:
            TabRootView()
        }
    }
}
