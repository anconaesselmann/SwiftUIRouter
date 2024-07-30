//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI
import SwiftUIRouter

struct DetailA: View {

    @EnvironmentObject
    var router: AppRouter

    let value: String

    var body: some View {
        VStack {
            Text("detailA, \(value)")
            VStack {
                Button("content2") {
                    router.present(.root.split)
                }
                Button("with detail") {
                    router.present(.root.split, .content.c, .detail.c("ccc"))
                }
                Button("detail b 2") {
                    router.present(.detail.b("2"))
                }
                Button("modal detail c 3") {
                    router.present(.detail.c("3"), style: .modal)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.random)
        .navigationTitle("A: \(value)")
    }
}
