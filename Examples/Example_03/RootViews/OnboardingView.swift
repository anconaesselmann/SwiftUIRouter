//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SwiftUIRouter
import Onboarding

struct OnboardingView: View {

    @StateObject
    var onboardingRouter = Router<OnboardingRoute>()

    @StateObject
    var info = OnboardingInfo()

    let appRouter: AppRouter

    public init(router: AppRouter) {
        self.appRouter = router
    }

    var body: some View {
        NavigationTarget(
            .navStack,
            root: OnboardingRoute.userDetail,
            content: OnboardingFactory.init
        )
        .use(router: onboardingRouter, appRouter: appRouter)
        .environmentObject(info)
    }
}
