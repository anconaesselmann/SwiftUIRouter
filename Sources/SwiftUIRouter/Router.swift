//  Created by Axel Ancona Esselmann on 7/26/24.
//

import Foundation
import Combine

public class Router<R>: ObservableObject
    where R: RouteType
{
    private var _event = CurrentValueSubject<NavigationEvent<R>?, Never>(nil)

    public var event: AnyPublisher<NavigationEvent<R>, Never> {
        _event
            .filter { !($0?.style == .modal) }
            .compactMap { $0 }.eraseToAnyPublisher()
    }

    @Published
    public var modal: R?

    public init() { 
        _event
            .filter { $0?.style == .modal}
            .map { $0?.route }
            .assign(to: &$modal)
    }

    public func present(_ route: R, style: NavigationStyle = .none) {
        let event = NavigationEvent(route: route, style: style)
        self._event.send(event)
    }

    public func present(anyRoute: any RouteType, style: NavigationStyle = .none) -> Bool {
        guard let route = anyRoute as? R else {
            return false
        }
        self.present(route, style: style)
        return true
    }

    public func asAnyRouter() -> AnyRouter {
        AnyRouter(self)
    }
}
