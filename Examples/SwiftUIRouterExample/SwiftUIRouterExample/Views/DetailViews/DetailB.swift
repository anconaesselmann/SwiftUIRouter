//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI
import SwiftUIRouter

struct DetailB: View {

    @EnvironmentObject
    var router: AppRouter

    let value: String

    var body: some View {
        VStack {
            Text("detailB, \(value)")
            VStack {
                let newValue = (Int(value) ?? 0) + 1
                Button("detail c \(newValue)") {
                    router.present(.detail.c("\(newValue)"))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.random)
        .navigationTitle("B: \(value)")
    }
}
