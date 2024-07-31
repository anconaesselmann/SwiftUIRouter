//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SwiftUIRouter

struct SecondView: View {

    @EnvironmentObject
    var router: Router<Route>

    let id: Int

    var body: some View {
        VStack {
            Text("Screen with id: \(id)")
            HStack {
                Button("back") {
                    let previousId = id - 1
                    if previousId < 1 {
                        router.present(.home)
                    } else {
                        router.present(.detail(previousId))
                    }
                }
                Button("next") {
                    router.present(.detail(id + 1))
                }
            }
            .padding()
            if id > 0 {
                Button("home") {
                    router.present(.home)
                }
            }
        }
        .navigationTitle("Screen \(id)")
    }
}
