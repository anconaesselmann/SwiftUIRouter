//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI
import SwiftUIRouter

struct TabRootView: View {

    @EnvironmentObject
    var router: RootRouter

    var body: some View {
        TabView(selection: router.tab) {
            VStack {
                Button("change") {
                    router.tab(1)
                }
                NavigationTarget(.navStack, root: ContentRoute.contentA, content: ContentFactory.init)
            }
            .tabItem { Text("tab 1") }
            .tag(0)
            NavigationTarget(.navStack, root: DetailRoute.detailA("a"), content: DetailFactory.init)
                .tabItem { Text("tab 2") }
                .tag(1)
        }
    }
}
