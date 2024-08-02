//  Created by Axel Ancona Esselmann on 8/2/24.
//

import Foundation
import SwiftUIRouter
import Combine
import Auth
import SharedUI

@MainActor
class CreatePasswordViewModel: ObservableObject {

    var isValid: Bool {
        info.passwordIsValid
    }

    var password: String {
        get { info.password ?? "" }
        set { info.password = newValue }
    }
    var passwordConfirmed: String {
        get { info.passwordConfirmed ?? "" }
        set { info.passwordConfirmed = newValue }
    }

    @Published
    private(set) var state: ViewState = .idle

    private let router: AppRouter
    private let auth: AuthManager
    private var info: OnboardingInfo

    private var subscription: AnyCancellable?

    init(auth: AuthManager, info: OnboardingInfo, router: AppRouter) {
        self.auth = auth
        self.info = info
        self.router = router

        subscription = info.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }

    func createTapped() {
        Task { [weak self] in
            await self?.create()
        }
    }

    private func create() async {
        guard
            let name = info.name,
            let password = info.password,
            let passwordConfirmed = info.passwordConfirmed
        else {
            state = .error(OnboardingError.missingProperty)
            return
        }
        guard password == passwordConfirmed else {
            state = .error(OnboardingError.passwordMismatch)
            return
        }
        state = .loading
        do {
            try await auth.createUser(name: name, password: password)
            state = .idle
            router.present(.loggedIn)
        } catch {
            state = .error(error)
        }
    }
}
