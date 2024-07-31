//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SwiftUIRouter

struct AppLauchView: View {

    @EnvironmentObject
    var router: Router<Route>

    var body: some View {
        VStack {
            Text("App launched")
            Button("next") {
                router.present(.detail(1))
            }
        }
    }
}
