//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI
import SwiftUIRouter

struct AddressBar: View {

    @EnvironmentObject
    private var router: AppRouter

    @State
    private var userInput: String = ""

    var body: some View {
        HStack {
            TextField("go to", text: $userInput)
            Button("go") {
                router.present(URL(appUrl: userInput))
            }.buttonStyle(.plain)
        }.frame(maxWidth: 400)
    }
}
