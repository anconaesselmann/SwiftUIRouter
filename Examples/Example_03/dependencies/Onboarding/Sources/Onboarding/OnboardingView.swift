//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SwiftUIRouter
import Onboarding

public struct OnboardingView: View {

    @StateObject
    private var onboardingRouter = Router<OnboardingRoute>()

    @StateObject
    private var info = OnboardingInfo()

    @EnvironmentObject
    private var appRouter: AppRouter

    public init() { }

    public var body: some View {
        NavigationTarget(
            .navStack,
            root: OnboardingRoute.userDetail,
            content: OnboardingFactory.init
        )
        .use(router: onboardingRouter, appRouter: appRouter)
        .environmentObject(info)
    }
}
