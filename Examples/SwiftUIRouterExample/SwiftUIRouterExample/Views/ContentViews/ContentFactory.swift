//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI

struct ContentFactory: View {

    let route: ContentRoute

    var body: some View {
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
