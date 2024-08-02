//  Created by Axel Ancona Esselmann on 8/2/24.
//

import Foundation
import SwiftUIRouter

@MainActor
class UserInfoViewModel: ObservableObject {

    private var router: Router<OnboardingRoute>

    private var info: OnboardingInfo

    var email: String {
        get { info.email ?? "" }
        set { info.email = newValue }
    }

    var name: String {
        get { info.name ?? "" }
        set { info.name = newValue }
    }

    var dob: Date {
        get { info.dob ?? .now }
        set { info.dob = newValue }
    }

    var isValid: Bool {
        info.name != nil && info.email != nil && info.dob != nil
    }

    init(router: Router<OnboardingRoute>, info: OnboardingInfo) {
        self.router = router
        self.info = info
    }

    func next() {
        router.present(.createPassword)
    }
}
