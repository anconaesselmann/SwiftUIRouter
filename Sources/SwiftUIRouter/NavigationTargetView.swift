//  Created by Axel Ancona Esselmann on 7/27/24.
//

import SwiftUI

public struct NavigationTargetView<R, Content>: View
    where R: RouteType, Content: View
{
    @EnvironmentObject
    private var router: Router<R>

    private var content: (R) -> Content

    public init(_ startingRoute: R, @ViewBuilder content: @escaping (R) -> Content) {
        self.route = startingRoute
        self.content = content
    }

    @State
    private var route: R

    public var body: some View {
        content(route)
            .onReceive(router.event) { event in
                if event.withAnimation {
                    withAnimation {
                        self.route = event.route
                    }
                } else {
                    self.route = event.route
                }
            }
    }
}

public extension View {
    func onDeeplink(with urlType: String, use routers: [AnyRouter]) -> some View {
        self
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
        onDeeplink(with: urlType, use: [router1.asAnyRouter()])
    }

    func onDeeplink<R1, R2>(
        with urlType: String,
        use
          router1: Router<R1>,
        _ router2: Router<R2>
    ) -> some View
        where R1: RouteType, R2: RouteType
    {
        onDeeplink(with: urlType, use: [
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
        onDeeplink(with: urlType, use: [
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
        onDeeplink(with: urlType, use: [
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
        onDeeplink(with: urlType, use: [
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
        onDeeplink(with: urlType, use: [
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
        onDeeplink(with: urlType, use: [
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
        onDeeplink(with: urlType, use: [
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
        onDeeplink(with: urlType, use: [
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
        onDeeplink(with: urlType, use: [
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
