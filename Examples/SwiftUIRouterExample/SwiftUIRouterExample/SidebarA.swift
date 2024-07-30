//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUI
import SwiftUIRouter
import SwiftUIMarkdownView

struct SidebarA: View {

    @EnvironmentObject
    var contentRouter: ContentRouter

    @EnvironmentObject
    var detailRouter: DetailRouter

    @EnvironmentObject
    var rootRouter: RootRouter

    var body: some View {
        VStack {
            Button("a") {
                contentRouter.present(.contentA)
            }
            Button("b") {
                contentRouter.present(.contentB)
            }
            Button("c") {
                contentRouter.present(.contentC)
            }


            Button("a_a") {
                contentRouter.present(.contentA, style: .withAnimation)
                detailRouter.present(.detailA("aaaa"), style: .withAnimation)
            }
            Button("b_b") {
                contentRouter.present(.contentB, style: .withAnimation)
                detailRouter.present(.detailB("bbbb"), style: .withAnimation)
            }
            Button("c_c") {
                contentRouter.present(.contentC, style: .withAnimation)
                detailRouter.present(.detailC("cccc"), style: .withAnimation)
            }

            Button("Content1") {
                rootRouter.present(.test1)
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



- [modal](example://detailA/aaa?style=modal)

""")
            }
            Spacer()
        }
    }
}
