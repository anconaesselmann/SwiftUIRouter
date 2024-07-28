//  Created by Axel Ancona Esselmann on 7/26/24.
//

import SwiftUI

public extension View {
    func route<R, T, ModalContent>(
        using router: StateObject<Router<R, T>>,
        appLinks: Set<String> = [],
        @ViewBuilder
        modalContent: @escaping (R) -> ModalContent
    ) -> some View
    where R: RouteType, T: NavigationTarget, ModalContent: View
    {
        self
            .handlesExternalEvents(preferring: appLinks, allowing: appLinks)
            .onOpenURL(perform: router.wrappedValue.onOpenUrl)
            .sheet(
                item: Binding(
                    get: { router.wrappedValue.modal },
                    set: { router.wrappedValue.modal = $0 }
                ),
                content: modalContent
            )
            .environmentObject(router.wrappedValue)
    }
}
