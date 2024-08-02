## SwiftUIRouter

A decoupled routing layer for SwiftUI

*by Axel Ancona Esselmann*


### [Example 01](https://github.com/anconaesselmann/SwiftUIRouter/tree/main/Examples/Example_01):

We set up a `NavigationTarget` to respond to route changes:

```swift
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
```

Anywhere in our app we can now trigger our `NavigationTarget` to swap out it's root view:

```swift
struct SomeView: View {

    @EnvironmentObject
    var router: Router<Route>

    var body: some View {
        Button("home", systemImage: "house.circle.fill") {
            router.present(.home)
        }
    }
}
```

### [Example 02](https://github.com/anconaesselmann/SwiftUIRouter/tree/main/Examples/Example_02):

Routes can have IDs. [Example 02](https://github.com/anconaesselmann/SwiftUIRouter/tree/main/Examples/Example_02) revisits the first example but the `detail` route has an ID:

```swift
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
```

### [Example 03](https://github.com/anconaesselmann/SwiftUIRouter/tree/main/Examples/Example_03):

Example 3 is a small "real world example". We manage a logged in state and demonstrate how state might be managed inside an app that uses `SwiftUIRouter`.

`NavigationTargets`s can be nested. [Example 3](https://github.com/anconaesselmann/SwiftUIRouter/tree/main/Examples/Example_03) uses the default `NavigationTargets` for maintaining a `loggedIn`, an `onboarding` and a `loggedOut` state. To demonstrate how `SwiftUIRouter` can facilitate a decoupled routing layer each of the main app-states are their own [SPM](https://www.swift.org/documentation/package-manager/) packages that get imported by the the main app as dependencies.

The `onboarding` flow makes use of `NavigationTarget`'s ability to use a `NavigationStack` internally:

```swift
NavigationTarget(
    .navStack,
    root: OnboardingRoute.userDetail,
    content: OnboardingFactory.init
)
.use(router: onboardingRouter)
```

The `loggedIn` state demonstrates how `NavigationTarget` can manage tabs inside a `TabView`:

```swift
TabView {
    NavigationTarget(root: Route.home, content: LoggedInFactory.init)
        .tag(0)
    NavigationTarget(root: Route.detail(1), content: LoggedInFactory.init)
        .tag(1)
}
.toolbar {
    Button("Log out", action: vm.logOutPressed)
}.use(router: router)
```

Routing within each of the app components is typesafe. The internal `Router` uses the route specified in each package:

```swift
@EnvironmentObject
var router: Router<OnboardingRoute>

var body: some View {
    Button("Log out") {
        router.present(.createPassword)
    }
}
```

Routes not defined in a package can be reached via a type-erased `AppRouter` which uses `URL`s instead of typed `RouteType`s:

```swift
extension URL {
    static let loggedIn = URL(string: "app://loggedIn")
    static let loggedOut = URL(string: "app://loggedOut")
}

@EnvironmentObject
var router: AppRouter

var body: some View {
    Button("Log out") {
        router.present(.loggedOut)
    }
}
```

Here we trade type-safety for decoupling.

Note: AppRouter gets injected into the view environment when we use `.use(routers:)`. If a module calls `.use(routers:)` on a nested  `NavigationTarget` and we want to be able to route outside of the package we have to pass in the existing app router instance:

```swift
	// A local router manages routing for the scope of this package
    @StateObject
    var onboardingRouter = Router<OnboardingRoute>()

    // If we want to navigate outside of this package's scope we have to do so 
    // with `AppRouter`, which will have been created when we called `.use(routers:)` 
    // on our parent `NavigationTarget`
    @EnvironmentObject
    var appRouter: AppRouter


    var body: some View {
        NavigationTarget(
            .navStack,
            root: OnboardingRoute.userDetail,
            content: OnboardingFactory.init
        )
        // We inject the local router and to not mask the `AppRouter` 
        // from our parent scope we pass it in as well
        .use(router: onboardingRouter, appRouter: appRouter)
    }
```

### [Example 04](https://github.com/anconaesselmann/SwiftUIRouter/tree/main/Examples/SwiftUIRouterExample) 
(Apologies, Example 04 needs a bit of cleanup work) demonstrates how `SwiftUIRouter`'s support for `URL`-routing can be utilized to facilitate deeplinking to any screen in the app that has a route.

### Final thoughts

- Deciding when to create a SPM package from a part of an app is a delicate process. There is extra work involved in maintaining a package (I created a [tool](https://github.com/anconaesselmann/CLSPM) that can help) and if done in excess the result can turn into a nightmare of trying to prevent circular dependencies.
- If you are tempted to pass more than an ID along with your routes I encourage you to have a look at [`LoadableView`](https://github.com/anconaesselmann/LoadableView). I have found that passing more than IDs causes coupling that can make it difficult to change the flow of navigation and in general makes Views less reusable in other contexts. [`LoadableView`](https://github.com/anconaesselmann/LoadableView) encourages an architecture that allows Views to inflate themselves from a local or remote state with just an ID.
