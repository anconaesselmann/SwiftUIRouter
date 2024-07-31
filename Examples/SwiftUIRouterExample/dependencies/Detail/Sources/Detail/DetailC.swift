//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI
import SwiftUIRouter
import Routes

struct DetailC: View {

    @EnvironmentObject
    var router: AppRouter

    let value: String

    var body: some View {
        VStack {
            Text("detailC, \(value)")
            VStack {
                let newValue = (Int(value) ?? 0) + 1
                Button("detail c \(newValue)") {
                    router.present(.detail.c("\(newValue)"))
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.random)
        .navigationTitle("C: \(value)")
    }
}
