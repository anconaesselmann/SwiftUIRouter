//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI
import SwiftUIRouter

struct DetailC: View {

    @EnvironmentObject
    var router: AppRouter

    let value: String

    @State
    var userInput: String = ""

    var body: some View {
        VStack {
            Text("detailC, \(value)")
            VStack {
                let newValue = (Int(value) ?? 0) + 1
                Button("detail c \(newValue)") {
                    router.present(.detail.c("\(newValue)"))
                }
                HStack {
                    TextField("go to", text: $userInput)
                    Button("go") {
                        router.present(URL(appUrl: userInput))
                    }
                }.frame(maxWidth: 400)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.random)
        .navigationTitle("C: \(value)")
    }
}
