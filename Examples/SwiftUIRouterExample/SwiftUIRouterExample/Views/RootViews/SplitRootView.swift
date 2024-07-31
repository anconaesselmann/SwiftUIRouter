//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUI
import SwiftUIRouter

struct SplitRootView: View {
    var body: some View {
        NavigationSplitView {
            NavigationTarget(root: SidebarRoute.buttonSidebar, content: SidebarFactory.init)
        } content: {
            NavigationTarget(root: ContentRoute.contentA, content: ContentFactory.init)
        } detail: {
            NavigationTarget(root: DetailRoute.detailA("asdf"), content: DetailFactory.init)
        }
    }
}

