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


### [Example 02](https://github.com/anconaesselmann/SwiftUIRouter/tree/main/Examples/Example_02):

Routes can have IDs. [Example 02](https://github.com/anconaesselmann/SwiftUIRouter/tree/main/Examples/Example_02) revisits the first example but the `detail` route has an ID:

    enum Route: RouteType {
        case home, detail(Int)

       enum RouteName: String {
            case home, detail
        }

        var rawValue: String {
            switch self {
            case .home: return RouteName.home.rawValue
            case .detail(let id): return "\(RouteName.detail.rawValue)/\(id)"
            }
        }

        init?(rawValue: String) {
            guard let (route, id) = Self.parts(for: rawValue) else { return nil }
            switch (RouteName(rawValue: route), id) {
            case (.home, nil): self = .home
            case (.detail, let id):
                guard let id = id, let id = Int(id) else { return nil }
                self = .detail(id)
            default: return nil
            }
        }
    }

