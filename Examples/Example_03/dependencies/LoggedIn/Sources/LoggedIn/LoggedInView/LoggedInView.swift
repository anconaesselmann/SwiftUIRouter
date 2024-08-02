//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SwiftUIRouter
import SharedUI

public struct LoggedInView: View {

    @StateObject
    private var vm: LoggedInViewModel

    @StateObject
    private var router = Router<Route>()

    public init(vm: LoggedInViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }

    public var body: some View {
        LoadingView(vm.state) {
            TabView {
                NavigationTarget(root: Route.home, content: LoggedInFactory.init)
                    .tag(0)
                NavigationTarget(root: Route.detail(1), content: LoggedInFactory.init)
                    .tag(1)
            }
            .toolbar {
                Button("Log out", action: vm.logOutPressed)
            }
        }.use(router: router)
    }
}
