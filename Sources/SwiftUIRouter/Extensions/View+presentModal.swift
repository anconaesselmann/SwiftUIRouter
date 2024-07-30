//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUI

public extension View {
    func presentModal<R, Content>(
        for router: Router<R>,
        @ViewBuilder content: @escaping (R) -> Content
    ) -> some View
        where R: RouteType, Content: View
    {
        self.sheet(
            item: Binding(
                get: { router.modal },
                set: { router.modal = $0 }
            ),
            content: content
        )
    }
}
