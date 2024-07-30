//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUI
import SwiftUIRouter
import SwiftUIMarkdownView

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
                router.present(.root.test1, .detail.a("aaa"))
            }
            ScrollView {
                MarkdownView(markdown: """
- [A](example://contentA)
- [B](example://contentB)
- [C](example://contentC)

- [A withAnimation](example://contentA?with_animation=true)
- [B withAnimation](example://contentB?with_animation=true)
- [C withAnimation](example://contentC?with_animation=true)

- [A](example://detailA/aaa)
- [B](example://detailB/bbb)
- [C](example://detailC/ccc)


- [A a](example://contentA/detailA/aaa)
- [B b](example://contentB/detailB/bbb)
- [C c](example://contentC/detailC/ccc)

- [content1](example://test1)

- [detail modal](example://detailA/aaa?style=modal)
- [content modal](example://contentA?style=modal)

- [test1 modal](example://test1/contentA/detailC/100?style=modal)
""")
            }
            Spacer()
        }
    }
}
