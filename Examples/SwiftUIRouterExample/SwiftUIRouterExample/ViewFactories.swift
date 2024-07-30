//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUI

struct RootFactory: View {

    let route: RootRoute

    var body: some View {
        switch route {
        case .test1:
            ContentView()
        case .test2:
            ContentViewSplitView()
        }
    }
}

struct SidebarFactory: View {

    let route: SidebarRoute

    var body: some View {
        switch route {
        case .sidebarA:
            SidebarA()
        }
    }
}

struct ContentFactory: View {

    let route: ContentRoute

    var body: some View {
        switch route {
        case .contentA:
            Text("contentA")
        case .contentB:
            Text("contentB")
        case .contentC:
            Text("contentC")
        }
    }
}

struct DetailFactory: View {

    let route: DetailRoute

    var body: some View {
        VStack {
            switch route {
            case .detailA(let value):
                DetailA(value: value)
            case .detailB:
                Text("detailB")
            case .detailC:
                Text("detailC")
            }
        }
    }
}
