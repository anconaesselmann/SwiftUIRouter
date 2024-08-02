//  Created by Axel Ancona Esselmann on 8/1/24.
//

import SwiftUI
public class OnboardingInfo: ObservableObject {

    @Published
    var name: String?

    @Published
    var password: String?

    @Published
    var passwordConfirmed: String?

    @Published
    var email: String?

    @Published
    var dob: Date?

    var passwordIsValid: Bool {
        password == passwordConfirmed &&
        passwordConfirmed != nil &&
        !(passwordConfirmed?.isEmpty == true)
    }

    public init() {
        print("OnboardingInfo created")
    }

    deinit {
        print("OnboardingInfo destroyed")
    }
}

