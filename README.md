## SwiftUIRouter

A decoupled routing layer for SwiftUI

*by Axel Ancona Esselmann*


### [Example 01](https://github.com/anconaesselmann/SwiftUIRouter/tree/main/Examples/Example_01):

We set up a `NavigationTarget` to respond to route changes:

    enum Route: String, CaseIterable, RouteType {
        case home, detail
    }

    NavigationTarget(root: Route.home) { route in
        switch route {
        case .home:
            HomeView()
        case .detail:
            DetailView()
        }
    }.use(router: router)

Anywhere in our app we can now trigger our `NavigationTarget` to swap out it's root view:

    struct SomeView: View {

        @EnvironmentObject
        var router: Router<Route>

        var body: some View {
            Button("home", systemImage: "house.circle.fill") {
                router.present(.home)
            }
        }
    }
