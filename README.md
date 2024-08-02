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

### Example 03:

Example 3 is a small "real world example". We manage a logged in state and demonstrate how how state might be managed inside an app that uses SwiftUIRouter.

We can nest `NavigationTargets`s. Example 3 uses the default NavigationTarget for maintaining a logged in, an onboarding and a logged out state. To demonstrate how SwiftUIRouter can facilitate a decoupled routing layer each of the main app states are their own SPM packages and the main app imports them as dependencies.

The onboarding flow makes use of `NavigationTarget`'s ability to use a `NavigationStack` internally:

    NavigationTarget(
        .navStack,
        root: OnboardingRoute.userDetail,
        content: OnboardingFactory.init
    )
    .use(router: onboardingRouter, appRouter: appRouter)


The logged-in state demonstrates how `NavigationTarget` can manage tabs inside a `TabView`:

    TabView {
        NavigationTarget(root: Route.home, content: LoggedInFactory.init)
            .tag(0)
        NavigationTarget(root: Route.detail(1), content: LoggedInFactory.init)
            .tag(1)
    }
    .toolbar {
        Button("Log out", action: vm.logOutPressed)
    }.use(router: router)


Routing within each of the app components is typesafe. The internal `Router` uses the route specified in each package. Each package allows navigatin to outside routes with `AppRouter`. We specify a URL to facilitate external routing.

	extension URL {
	    static let loggedIn = URL(string: "app://loggedIn")
	    static let loggedOut = URL(string: "app://loggedOut")
	}

	let router: AppRouter

	Button("Log out") {
		router.present(.loggedOut)
	}

Here we trade type-safety for decoupling.


Example 04 demonstrates how SwiftUIRouter's support for URL routing can be utilized to facilitate deeplinking



Note: If you are tempted to pass more than an ID with your routes have a look at `LoadableView`. In my experience passing more than IDs causes coupling in my apps that makes view re-use really difficult. `LoadableView` facilitates views that can inflate themselves from a local or remote state with just an ID.



