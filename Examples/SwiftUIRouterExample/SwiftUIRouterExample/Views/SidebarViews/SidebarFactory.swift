//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI

struct SidebarFactory: View {

    let route: SidebarRoute

    var body: some View {
        switch route {
        case .sidebarA:
            SidebarA()
        }
    }
}
