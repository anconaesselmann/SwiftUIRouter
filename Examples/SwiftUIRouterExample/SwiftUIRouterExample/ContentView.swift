//  Created by Axel Ancona Esselmann on 7/28/24.
//

import SwiftUI
import SwiftUIRouter


struct ContentView: View {

    @EnvironmentObject
    var router: AppRouter

    @EnvironmentObject
    var detailRouter: DetailRouter

    @State private var path = [DetailRoute]()

    var body: some View {
        VStack {
            NavigationStackTarget(DetailRoute.detailA("start detailA"), content: DetailFactory.init)
        }
    }
}
