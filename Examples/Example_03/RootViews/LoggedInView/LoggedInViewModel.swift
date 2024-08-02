//  Created by Axel Ancona Esselmann on 8/2/24.
//

import Foundation
import SwiftUIRouter
import Auth
import SharedUI

@MainActor
class LoggedInViewModel: ObservableObject {

    private let auth: AuthManager
    private let router: Router<RootRoute>

    @Published
    private(set) var state: ViewState = .idle

    init(auth: AuthManager, router: Router<RootRoute>) {
        self.auth = auth
        self.router = router
    }

    func logOutPressed() {
        Task { [weak self] in
            await self?.logOut()
        }
    }

    private func logOut() async {
        state = .loading
        do {
            try await auth.logOut()
            state = .idle
            router.present(.loggedOut)
        } catch {
            state = .error(error)
        }
    }
}
