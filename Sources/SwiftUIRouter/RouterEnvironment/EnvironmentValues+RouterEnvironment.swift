//  Created by Axel Ancona Esselmann on 11/21/24.
//

import SwiftUI

public extension EnvironmentValues {
    var routerEnvironment: RouterEnvironment {
        get {
            self[RouterEnvironmentKey.self]
        }
        set {
            self[RouterEnvironmentKey.self] = newValue
        }
    }
}
