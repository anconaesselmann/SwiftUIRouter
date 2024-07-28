//  Created by Axel Ancona Esselmann on 7/26/24.
//

import Foundation
import Combine

public class Router<R, T>: ObservableObject
    where R: RouteType, T: NavigationTarget
{
    private var _event = CurrentValueSubject<NavigationEvent<R, T>?, Never>(nil)

    public var event: AnyPublisher<NavigationEvent<R, T>, Never> {
        _event.compactMap { $0 }.eraseToAnyPublisher()
    }

    @Published
    public var modal: R?

    public init() { 
        _event
            .filter { $0?.target.isModal ?? false }
            .map { $0?.route }
            .assign(to: &$modal)
    }

    public func present(_ route: R, target: T, withAnimation: Bool = false) {
        let event = NavigationEvent(route: route, target: target, withAnimation: withAnimation)
        self._event.send(event)
    }

    public func onOpenUrl(_ url: URL) {
        guard let event = NavigationEvent<R, T>(url) else {
            return
        }
        _event.send(event)
    }
}
