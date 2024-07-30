//  Created by Axel Ancona Esselmann on 7/28/24.
//

import SwiftUI
import SwiftUIRouter

struct ContentView: View {

    @EnvironmentObject
    var router: AppRouter

    var body: some View {
        VStack {
            Button("content2") {
                router.present(.root.test2)
            }
            Button("with detail") {
                router.present(.root.test2, .content.c, .detail.c("ccc"))
            }
        }
    }
}
