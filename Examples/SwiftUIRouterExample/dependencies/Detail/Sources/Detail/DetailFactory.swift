//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUI
import Routes

public struct DetailFactory: View {

    private let route: DetailRoute

    public init(route: DetailRoute) {
        self.route = route
    }

    public var body: some View {
        VStack {
            switch route {
            case .detailA(let value):
                DetailA(value: value)
            case .detailB(let value):
                DetailB(value: value)
            case .detailC(let value):
                DetailC(value: value)
            }
        }
    }
}
