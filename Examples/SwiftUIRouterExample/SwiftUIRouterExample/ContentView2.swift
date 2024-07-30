//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUI
import SwiftUIRouter

struct ContentView2: View {
    var body: some View {
        NavigationSplitView {
            NavigationTargetView(SidebarRoute.sidebarA, content: SidebarFactory.init)
        } content: {
            NavigationTargetView(ContentRoute.contentA, content: ContentFactory.init)
        } detail: {
            NavigationTargetView(DetailRoute.detailA("asdf"), content: DetailFactory.init)
        }
    }
}
