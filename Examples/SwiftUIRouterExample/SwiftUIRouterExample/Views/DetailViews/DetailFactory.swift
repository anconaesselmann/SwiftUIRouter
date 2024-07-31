//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUI

struct DetailFactory: View {

    let route: DetailRoute

    var body: some View {
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
