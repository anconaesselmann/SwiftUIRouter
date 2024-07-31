//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SwiftUIRouter

struct DetailView: View {

    @EnvironmentObject
    var router: Router<Route>

    var body: some View {
        VStack {
            Text("Detail")
                .padding()
            Button("home", systemImage: "house.circle.fill") {
                router.present(.home)
            }
            .buttonStyle(.plain)
            Spacer()
        }.padding()
    }
}
