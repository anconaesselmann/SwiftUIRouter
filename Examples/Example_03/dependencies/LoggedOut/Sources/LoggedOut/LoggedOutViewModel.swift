//  Created by Axel Ancona Esselmann on 8/2/24.
//

import Foundation
import SwiftUIRouter
import Auth
import SharedUI

@MainActor
public class LoggedOutViewModel: ObservableObject {

    let auth: AuthManager

    let router: AppRouter

    @Published
    var userName = ""

    @Published
    var password = ""

    @Published
    private(set) var state: ViewState = .idle

    public init(auth: AuthManager, router: AppRouter) {
        self.auth = auth
        self.router = router
    }

    func logInPressed() {
        Task { [weak self] in
            await self?.logIn()
        }
    }

    private func logIn() async {
        do {
            state = .loading
            try await auth.logIn(name: userName, password: password)
            state = .idle
            router.present(.loggedIn)
        } catch {
            state = .error(error)
        }
    }

    func signUp() {
        router.present(.onboarding)
    }
}
