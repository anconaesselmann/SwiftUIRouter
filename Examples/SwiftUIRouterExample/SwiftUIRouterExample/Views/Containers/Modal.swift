//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUI
import SwiftUIRouter

struct Modal<Content>: View, ModalType
    where Content: View
{

    @ViewBuilder
    var content: () -> Content

    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        Sheet {
            content()
        }
        .frame(minWidth: 300, minHeight: 300)
    }
}
