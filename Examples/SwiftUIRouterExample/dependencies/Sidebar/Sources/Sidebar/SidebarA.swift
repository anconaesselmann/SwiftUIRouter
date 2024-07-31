//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUI
import SwiftUIRouter
import Routes

struct SidebarA: View {

    @EnvironmentObject
    var router: AppRouter

    var body: some View {
        VStack {
            Button("a") {
                router.present(.content.a)
            }
            Button("b") {
                router.present(.content.b)
            }
            Button("c") {
                router.present(.content.c)
            }
            Button("a_a") {
                router.present(.content.a, .detail.a("aaa"), style: .withAnimation)
            }
            Button("b_b") {
                router.present(.content.b, .detail.b("bbb"), style: .withAnimation)
            }
            Button("c_c") {
                router.present(.content.c, .detail.c("ccc"), style: .withAnimation)
            }

            Button("Content1") {
                router.present(.root.stack, .detail.a("aaa"))
            }
            Spacer()
        }
    }
}
