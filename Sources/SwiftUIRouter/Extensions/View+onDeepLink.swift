//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUI

public extension View {
    func onDeeplink(with urlType: String, use routers: [AnyRouter]) -> some View {
        self
            .environmentObject(AppRouter { url in
                routers.route(url)
            })
            .handlesExternalEvents(
                preferring: [urlType],
                allowing: [urlType]
            )
            .onOpenURL(perform: { url in
                routers.route(url)
            })
    }

    func onDeeplink<R1>(with urlType: String, use router1: Router<R1>) -> some View
        where R1: RouteType
    {
        self.environmentObject(router1)
            .onDeeplink(with: urlType, use: [router1.asAnyRouter()])
    }

    func onDeeplink<R1, R2>(
        with urlType: String,
        use
          router1: Router<R1>,
        _ router2: Router<R2>
    ) -> some View
        where R1: RouteType, R2: RouteType
    {
        self.environmentObject(router1)
            .environmentObject(router2)
            .onDeeplink(with: urlType, use: [
                router1.asAnyRouter(),
                router2.asAnyRouter()
            ])
    }

    func onDeeplink<R1, R2, R3>(
        with urlType: String,
        use
          router1: Router<R1>,
        _ router2: Router<R2>,
        _ router3: Router<R3>
    ) -> some View
        where R1: RouteType, R2: RouteType, R3: RouteType
    {
        self.environmentObject(router1)
            .environmentObject(router2)
            .environmentObject(router3)
            .onDeeplink(with: urlType, use: [
                router1.asAnyRouter(),
                router2.asAnyRouter(),
                router3.asAnyRouter()
            ])
    }

    func onDeeplink<R1, R2, R3, R4>(
        with urlType: String,
        use
          router1: Router<R1>,
        _ router2: Router<R2>,
        _ router3: Router<R3>,
        _ router4: Router<R4>
    ) -> some View
        where R1: RouteType, R2: RouteType, R3: RouteType, R4: RouteType
    {
        self.environmentObject(router1)
            .environmentObject(router2)
            .environmentObject(router3)
            .environmentObject(router4)
            .onDeeplink(with: urlType, use: [
                router1.asAnyRouter(),
                router2.asAnyRouter(),
                router3.asAnyRouter(),
                router4.asAnyRouter()
            ])
    }

    func onDeeplink<R1, R2, R3, R4, R5>(
        with urlType: String,
        use
          router1: Router<R1>,
        _ router2: Router<R2>,
        _ router3: Router<R3>,
        _ router4: Router<R4>,
        _ router5: Router<R5>
    ) -> some View
        where R1: RouteType, R2: RouteType, R3: RouteType, R4: RouteType, R5: RouteType
    {
        self.environmentObject(router1)
            .environmentObject(router2)
            .environmentObject(router3)
            .environmentObject(router4)
            .environmentObject(router5)
            .onDeeplink(with: urlType, use: [
                router1.asAnyRouter(),
                router2.asAnyRouter(),
                router3.asAnyRouter(),
                router4.asAnyRouter(),
                router5.asAnyRouter()
            ])
    }

    func onDeeplink<R1, R2, R3, R4, R5, R6>(
        with urlType: String,
        use
          router1: Router<R1>,
        _ router2: Router<R2>,
        _ router3: Router<R3>,
        _ router4: Router<R4>,
        _ router5: Router<R5>,
        _ router6: Router<R6>
    ) -> some View
        where R1: RouteType, R2: RouteType, R3: RouteType, R4: RouteType, R5: RouteType, R6: RouteType
    {
        self.environmentObject(router1)
            .environmentObject(router2)
            .environmentObject(router3)
            .environmentObject(router4)
            .environmentObject(router5)
            .environmentObject(router6)
            .onDeeplink(with: urlType, use: [
                router1.asAnyRouter(),
                router2.asAnyRouter(),
                router3.asAnyRouter(),
                router4.asAnyRouter(),
                router5.asAnyRouter(),
                router6.asAnyRouter()
            ])
    }

    func onDeeplink<R1, R2, R3, R4, R5, R6, R7>(
        with urlType: String,
        use
          router1: Router<R1>,
        _ router2: Router<R2>,
        _ router3: Router<R3>,
        _ router4: Router<R4>,
        _ router5: Router<R5>,
        _ router6: Router<R6>,
        _ router7: Router<R7>
    ) -> some View
        where R1: RouteType, R2: RouteType, R3: RouteType, R4: RouteType, R5: RouteType, R6: RouteType, R7: RouteType
    {
        self.environmentObject(router1)
            .environmentObject(router2)
            .environmentObject(router3)
            .environmentObject(router4)
            .environmentObject(router5)
            .environmentObject(router6)
            .environmentObject(router7)
                .onDeeplink(with: urlType, use: [
                router1.asAnyRouter(),
                router2.asAnyRouter(),
                router3.asAnyRouter(),
                router4.asAnyRouter(),
                router5.asAnyRouter(),
                router6.asAnyRouter(),
                router7.asAnyRouter()
            ])
    }

    func onDeeplink<R1, R2, R3, R4, R5, R6, R7, R8>(
        with urlType: String,
        use
          router1: Router<R1>,
        _ router2: Router<R2>,
        _ router3: Router<R3>,
        _ router4: Router<R4>,
        _ router5: Router<R5>,
        _ router6: Router<R6>,
        _ router7: Router<R7>,
        _ router8: Router<R8>
    ) -> some View
        where R1: RouteType, R2: RouteType, R3: RouteType, R4: RouteType, R5: RouteType, R6: RouteType, R7: RouteType, R8: RouteType
    {
        self.environmentObject(router1)
            .environmentObject(router2)
            .environmentObject(router3)
            .environmentObject(router4)
            .environmentObject(router5)
            .environmentObject(router6)
            .environmentObject(router7)
            .environmentObject(router8)
            .onDeeplink(with: urlType, use: [
                router1.asAnyRouter(),
                router2.asAnyRouter(),
                router3.asAnyRouter(),
                router4.asAnyRouter(),
                router5.asAnyRouter(),
                router6.asAnyRouter(),
                router7.asAnyRouter(),
                router8.asAnyRouter()
            ])
    }

    func onDeeplink<R1, R2, R3, R4, R5, R6, R7, R8, R9>(
        with urlType: String,
        use
          router1: Router<R1>,
        _ router2: Router<R2>,
        _ router3: Router<R3>,
        _ router4: Router<R4>,
        _ router5: Router<R5>,
        _ router6: Router<R6>,
        _ router7: Router<R7>,
        _ router8: Router<R8>,
        _ router9: Router<R9>
    ) -> some View
        where R1: RouteType, R2: RouteType, R3: RouteType, R4: RouteType, R5: RouteType, R6: RouteType, R7: RouteType, R8: RouteType, R9: RouteType
    {
        self.environmentObject(router1)
            .environmentObject(router2)
            .environmentObject(router3)
            .environmentObject(router4)
            .environmentObject(router5)
            .environmentObject(router6)
            .environmentObject(router7)
            .environmentObject(router8)
            .environmentObject(router9)
            .onDeeplink(with: urlType, use: [
                router1.asAnyRouter(),
                router2.asAnyRouter(),
                router3.asAnyRouter(),
                router4.asAnyRouter(),
                router5.asAnyRouter(),
                router6.asAnyRouter(),
                router7.asAnyRouter(),
                router8.asAnyRouter(),
                router9.asAnyRouter()
            ])
    }

    func onDeeplink<R1, R2, R3, R4, R5, R6, R7, R8, R9, R10>(
        with urlType: String,
        use
          router1: Router<R1>,
        _ router2: Router<R2>,
        _ router3: Router<R3>,
        _ router4: Router<R4>,
        _ router5: Router<R5>,
        _ router6: Router<R6>,
        _ router7: Router<R7>,
        _ router8: Router<R8>,
        _ router9: Router<R9>,
        _ router10: Router<R10>
    ) -> some View
        where R1: RouteType, R2: RouteType, R3: RouteType, R4: RouteType, R5: RouteType, R6: RouteType, R7: RouteType, R8: RouteType, R9: RouteType, R10: RouteType
    {
            self.environmentObject(router1)
                .environmentObject(router2)
                .environmentObject(router3)
                .environmentObject(router4)
                .environmentObject(router5)
                .environmentObject(router6)
                .environmentObject(router7)
                .environmentObject(router8)
                .environmentObject(router9)
                .environmentObject(router10)
                .onDeeplink(with: urlType, use: [
                    router1.asAnyRouter(),
                    router2.asAnyRouter(),
                    router3.asAnyRouter(),
                    router4.asAnyRouter(),
                    router5.asAnyRouter(),
                    router6.asAnyRouter(),
                    router7.asAnyRouter(),
                    router8.asAnyRouter(),
                    router9.asAnyRouter(),
                    router10.asAnyRouter()
                ])
    }
}
