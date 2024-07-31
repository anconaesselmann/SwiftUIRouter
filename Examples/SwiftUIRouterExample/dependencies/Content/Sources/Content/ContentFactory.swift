//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI
import Routes

public struct ContentFactory: View {

    private let route: ContentRoute

    public init(route: ContentRoute) {
        self.route = route
    }

    public var body: some View {
        switch route {
        case .contentA:
            ContentA()
        case .contentB:
            ContentB()
        case .contentC:
            ContentC()
        }
    }
}
