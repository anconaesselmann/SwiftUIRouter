//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUI
import SwiftUIRouter

struct SplitRootView: View {
    var body: some View {
        NavigationSplitView {
            NavigationTarget(SidebarRoute.sidebarA, content: SidebarFactory.init)
        } content: {
            NavigationTarget(ContentRoute.contentA, content: ContentFactory.init)
        } detail: {
            NavigationTarget(DetailRoute.detailA("asdf"), content: DetailFactory.init)
        }
    }
}

