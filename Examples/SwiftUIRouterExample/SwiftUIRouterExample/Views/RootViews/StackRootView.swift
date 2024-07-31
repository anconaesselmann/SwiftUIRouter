//  Created by Axel Ancona Esselmann on 7/28/24.
//

import SwiftUI
import SwiftUIRouter

struct StackRootView: View {

    @EnvironmentObject
    var router: AppRouter

    @State private var path = [DetailRoute]()

    var body: some View {
        VStack {
            NavigationTarget(.navStack, root: DetailRoute.detailA("start detailA"), content: DetailFactory.init)
        }
    }
}
