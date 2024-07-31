//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SwiftUIRouter

struct HomeView: View {

    @EnvironmentObject
    var router: Router<Route>

    var body: some View {
        VStack {
            Text("Home")
                .padding()
            Button("detail", systemImage: "tree.circle.fill") {
                router.present(.detail)
            }
            .buttonStyle(.plain)
            Spacer()
        }.padding()
    }
}
