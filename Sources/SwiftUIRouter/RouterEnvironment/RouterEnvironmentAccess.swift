//  Created by Axel Ancona Esselmann on 11/21/24.
//

import SwiftUI

internal struct RouterEnvironmentAccess<Wrapped: View>: View {

    @Environment(\.routerEnvironment)
    private var routerEnvironment

    private let content: (RouterEnvironment) -> Wrapped

    init(@ViewBuilder _ content: @escaping (RouterEnvironment) -> Wrapped) {
        self.content = content
    }

    var body: some View {
        content(routerEnvironment)
    }
}
