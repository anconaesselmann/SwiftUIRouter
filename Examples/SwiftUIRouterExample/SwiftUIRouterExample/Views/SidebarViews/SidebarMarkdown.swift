//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI
import SwiftUIMarkdownView

struct SidebarMarkdown: View {
    var body: some View {
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

- [content1](example://stack)

- [detail modal](example://detailA/aaa?style=modal)
- [content modal](example://contentA?style=modal)

- [stack modal](example://stack/contentA/detailC/100?style=modal)

- [tabs](example://tab/contentA/detailC/100)
- [tabs modal](example://tab/contentA/detailC/100?style=modal)
""")
        }
    }
}
