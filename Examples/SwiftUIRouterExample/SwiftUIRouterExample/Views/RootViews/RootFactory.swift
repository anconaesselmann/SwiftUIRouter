//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI

struct RootFactory: View {

    let route: RootRoute

    var body: some View {
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
