//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI

public struct LoggedInFactory: View {

    private let route: Route

    public init(route: Route) {
        self.route = route
    }

    public var body: some View {
        switch route {
        case .home:
            HomeView()
        case .detail(let id):
            DetailView(id: id)
        }
    }
}
