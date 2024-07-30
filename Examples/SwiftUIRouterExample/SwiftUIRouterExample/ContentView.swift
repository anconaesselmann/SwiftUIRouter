//  Created by Axel Ancona Esselmann on 7/28/24.
//

import SwiftUI
import SwiftUIRouter

struct ContentView: View {

    @EnvironmentObject
    var router: RootRouter

    var body: some View {
        Button("content2") {
            router.present(.test2)
        }
    }
}
