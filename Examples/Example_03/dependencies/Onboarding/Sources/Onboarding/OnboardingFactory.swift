//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SwiftUIRouter
import Auth

public struct OnboardingFactory: View {

    @EnvironmentObject
    private var info: OnboardingInfo

    @EnvironmentObject
    private var auth: AuthManager

    @EnvironmentObject
    private var router: AppRouter

    @EnvironmentObject
    private var onboardingRouter: Router<OnboardingRoute>

    private let route: OnboardingRoute

    public init(route: OnboardingRoute) {
        self.route = route
    }

    public var body: some View {
        switch route {
        case .userDetail:
            let vm = UserInfoViewModel(router: onboardingRouter, info: info)
            UserInfoView(vm: vm)
        case .createPassword:
            let vm = CreatePasswordViewModel(auth: auth, info: info, router: router)
            CreatePasswordView(vm: vm)
        }
    }
}
