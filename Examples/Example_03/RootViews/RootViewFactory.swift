//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SwiftUIRouter
import Auth
import LoggedOut

struct RootViewFactory: View {

    @EnvironmentObject
    private var rootRouter: Router<RootRoute>

    @EnvironmentObject
    private var appRouter: AppRouter

    @StateObject
    private var auth: AuthManager

    private let route: RootRoute

    init(route: RootRoute, authService: AuthServiceType) {
        self.route = route
        _auth = StateObject(wrappedValue: AuthManager(authService: authService))
    }

    init(route: RootRoute) {
        self.route = route
        _auth = StateObject(wrappedValue: AuthManager(authService: MockAuthService()))
    }

    var body: some View {
        switch route {
        case .loggedOut:
            let vm = LoggedOutViewModel(auth: auth, router: appRouter)
            LoggedOutView(vm: vm)
        case .onboarding:
            OnboardingView(router: appRouter)
                .environmentObject(auth)
        case .loggedIn:
            let vm = LoggedInViewModel(auth: auth, router: rootRouter)
            LoggedInView(vm: vm)
                .environmentObject(auth)
        }
    }
}
