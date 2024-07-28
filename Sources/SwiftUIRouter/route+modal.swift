//  Created by Axel Ancona Esselmann on 7/26/24.
//

import SwiftUI

public extension View {
    func route<R, T, ModalContent>(
        using router: Router<R, T>,
        appLinks: Set<String> = [],
        @ViewBuilder
        modalContent: @escaping (R) -> ModalContent
    ) -> some View
    where R: RouteType, T: NavigationTarget, ModalContent: View
    {
        self
            .handlesExternalEvents(preferring: appLinks, allowing: appLinks)
            .onOpenURL(perform: router.onOpenUrl)
            .sheet(
                item: Binding(
                    get: { router.modal },
                    set: { router.modal = $0 }
                ),
                content: modalContent
            )
            .environmentObject(router)
    }

    func route<R, T, ModalContent>(
        using router: Router<R, T>,
        appLink: String,
        @ViewBuilder
        modalContent: @escaping (R) -> ModalContent
    ) -> some View
    where R: RouteType, T: NavigationTarget, ModalContent: View
    {
        route(using: router, appLinks: [appLink], modalContent: modalContent)
    }
}
