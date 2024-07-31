//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI
import Routes

public struct SidebarFactory: View {

    private let route: SidebarRoute

    public init(route: SidebarRoute) {
        self.route = route
    }

    public var body: some View {
        switch route {
        case .buttonSidebar:
            SidebarA()
        case .markdownSidebar:
            SidebarMarkdown()
        }
    }
}
