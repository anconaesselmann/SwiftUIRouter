//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SwiftUIRouter

struct HomeView: View {

    @EnvironmentObject
    var router: Router<Route>

    var body: some View {
        VStack {
            Text("Home")
            Button("next") {
                router.present(.detail(1))
            }
        }
    }
}

struct FriendsListView: View {
    var body: some View {
        List {
            
        }
    }
}
