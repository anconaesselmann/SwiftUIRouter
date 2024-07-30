//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI

public extension View {
    func use<T>(router: Router<T>) -> some View {
        self.environmentObject(router)
            .environmentAppRouter([router.asAnyRouter()])
    }

    func use<R1, R2>(
        routers r1: Router<R1>,
              _ r2: Router<R2>
    ) -> some View {
        self
            .environmentObject(r1)
            .environmentObject(r2)
            .environmentAppRouter([
                r1.asAnyRouter(),
                r2.asAnyRouter()
            ])
    }

    func use<R1, R2, R3>(
        routers r1: Router<R1>,
              _ r2: Router<R2>,
              _ r3: Router<R3>
    ) -> some View {
        self
            .environmentObject(r1)
            .environmentObject(r2)
            .environmentObject(r3)
            .environmentAppRouter([
                r1.asAnyRouter(),
                r2.asAnyRouter(),
                r3.asAnyRouter()
            ])
    }

    func use<R1, R2, R3, R4>(
        routers r1: Router<R1>,
              _ r2: Router<R2>,
              _ r3: Router<R3>,
              _ r4: Router<R4>
    ) -> some View {
        self
            .environmentObject(r1)
            .environmentObject(r2)
            .environmentObject(r3)
            .environmentObject(r4)
            .environmentAppRouter([
                r1.asAnyRouter(),
                r2.asAnyRouter(),
                r3.asAnyRouter(),
                r4.asAnyRouter()
            ])
    }

    func use<R1, R2, R3, R4, R5>(
        routers r1: Router<R1>,
              _ r2: Router<R2>,
              _ r3: Router<R3>,
              _ r4: Router<R4>,
              _ r5: Router<R5>
    ) -> some View {
        self
            .environmentObject(r1)
            .environmentObject(r2)
            .environmentObject(r3)
            .environmentObject(r4)
            .environmentObject(r5)
            .environmentAppRouter([
                r1.asAnyRouter(),
                r2.asAnyRouter(),
                r3.asAnyRouter(),
                r4.asAnyRouter(),
                r5.asAnyRouter()
            ])
    }

    func use<R1, R2, R3, R4, R5, R6>(
        routers r1: Router<R1>,
              _ r2: Router<R2>,
              _ r3: Router<R3>,
              _ r4: Router<R4>,
              _ r5: Router<R5>,
              _ r6: Router<R6>
    ) -> some View {
        self
            .environmentObject(r1)
            .environmentObject(r2)
            .environmentObject(r3)
            .environmentObject(r4)
            .environmentObject(r5)
            .environmentObject(r6)
            .environmentAppRouter([
                r1.asAnyRouter(),
                r2.asAnyRouter(),
                r3.asAnyRouter(),
                r4.asAnyRouter(),
                r5.asAnyRouter(),
                r6.asAnyRouter()
            ])
    }

    func use<R1, R2, R3, R4, R5, R6, R7>(
        routers r1: Router<R1>,
              _ r2: Router<R2>,
              _ r3: Router<R3>,
              _ r4: Router<R4>,
              _ r5: Router<R5>,
              _ r6: Router<R6>,
              _ r7: Router<R7>
    ) -> some View {
        self
            .environmentObject(r1)
            .environmentObject(r2)
            .environmentObject(r3)
            .environmentObject(r4)
            .environmentObject(r5)
            .environmentObject(r6)
            .environmentObject(r7)
            .environmentAppRouter([
                r1.asAnyRouter(),
                r2.asAnyRouter(),
                r3.asAnyRouter(),
                r4.asAnyRouter(),
                r5.asAnyRouter(),
                r6.asAnyRouter(),
                r7.asAnyRouter()
            ])
    }

    func use<R1, R2, R3, R4, R5, R6, R7, R8>(
        routers r1: Router<R1>,
              _ r2: Router<R2>,
              _ r3: Router<R3>,
              _ r4: Router<R4>,
              _ r5: Router<R5>,
              _ r6: Router<R6>,
              _ r7: Router<R7>,
              _ r8: Router<R8>
    ) -> some View {
        self
            .environmentObject(r1)
            .environmentObject(r2)
            .environmentObject(r3)
            .environmentObject(r4)
            .environmentObject(r5)
            .environmentObject(r6)
            .environmentObject(r7)
            .environmentObject(r8)
            .environmentAppRouter([
                r1.asAnyRouter(),
                r2.asAnyRouter(),
                r3.asAnyRouter(),
                r4.asAnyRouter(),
                r5.asAnyRouter(),
                r6.asAnyRouter(),
                r7.asAnyRouter(),
                r8.asAnyRouter()
            ])
    }

    func use<R1, R2, R3, R4, R5, R6, R7, R8, R9>(
        routers r1: Router<R1>,
              _ r2: Router<R2>,
              _ r3: Router<R3>,
              _ r4: Router<R4>,
              _ r5: Router<R5>,
              _ r6: Router<R6>,
              _ r7: Router<R7>,
              _ r8: Router<R8>,
              _ r9: Router<R9>
    ) -> some View {
        self
            .environmentObject(r1)
            .environmentObject(r2)
            .environmentObject(r3)
            .environmentObject(r4)
            .environmentObject(r5)
            .environmentObject(r6)
            .environmentObject(r7)
            .environmentObject(r8)
            .environmentObject(r9)
            .environmentAppRouter([
                r1.asAnyRouter(),
                r2.asAnyRouter(),
                r3.asAnyRouter(),
                r4.asAnyRouter(),
                r5.asAnyRouter(),
                r6.asAnyRouter(),
                r7.asAnyRouter(),
                r8.asAnyRouter(),
                r9.asAnyRouter()
            ])
    }

    func use<R1, R2, R3, R4, R5, R6, R7, R8, R9, R10>(
        routers r1: Router<R1>,
              _ r2: Router<R2>,
              _ r3: Router<R3>,
              _ r4: Router<R4>,
              _ r5: Router<R5>,
              _ r6: Router<R6>,
              _ r7: Router<R7>,
              _ r8: Router<R8>,
              _ r9: Router<R9>,
              _ r10: Router<R10>
    ) -> some View {
        self
            .environmentObject(r1)
            .environmentObject(r2)
            .environmentObject(r3)
            .environmentObject(r4)
            .environmentObject(r5)
            .environmentObject(r6)
            .environmentObject(r7)
            .environmentObject(r8)
            .environmentObject(r9)
            .environmentObject(r10)
            .environmentAppRouter([
                r1.asAnyRouter(),
                r2.asAnyRouter(),
                r3.asAnyRouter(),
                r4.asAnyRouter(),
                r5.asAnyRouter(),
                r6.asAnyRouter(),
                r7.asAnyRouter(),
                r8.asAnyRouter(),
                r9.asAnyRouter(),
                r10.asAnyRouter()
            ])
    }
}

private extension View {
    func environmentAppRouter(_ routers: [AnyRouter]) -> some View {
        environmentObject(AppRouter { url in
            routers.route(url)
        })
    }
}
