//  Created by Axel Ancona Esselmann on 7/26/24.
//

import Foundation
import Combine
import SwiftUI

public class Router<R>: ObservableObject
    where R: RouteType
{
    private var _event = CurrentValueSubject<NavigationEvent<R>?, Never>(nil)

    public var event: AnyPublisher<NavigationEvent<R>, Never> {
        _event
            .filter { !($0?.style == .modal) }
            .removeDuplicates()
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }

    public var modal: Binding<R?>  {
        Binding { [weak self] in
            guard
                self?._event.value?.style == .modal,
                let route = self?._event.value?.route
            else {
                return nil
            }
            return route
        } set: { [weak self] in
            guard let self = self else {
                return
            }
            var event: NavigationEvent<R>? = self._event.value
            let newEvent: NavigationEvent<R>?
            if let newRoute = $0 {
                newEvent = NavigationEvent(route: newRoute, style: .modal, activeTab: event?.activeTab)
            } else {
                newEvent = nil
            }
            if newEvent != event {
                self._event.send(newEvent)
                self.objectWillChange.send()
            }
        }
    }

    public var tab: Binding<Int> {
        Binding(
            get: { [weak self] in
                self?.selectedTab ?? 0
            },
            set: { [weak self] in
                self?.tab($0)
            }
        )
    }

    public private(set) var selectedTab: Int = 0

    public func tab(_ selectedTab: Int) {
        self.selectedTab = selectedTab
        self.objectWillChange.send()
    }

    public init(cache: RouteCacheType? = nil) {
        if let cached = cache?.fetch(for: R.self) {
            let event = NavigationEvent(route: cached, style: .none, activeTab: nil)
            _event.send(event)
        }
    }

    public func present(_ route: R, style: NavigationStyle = .none, activeTab: Int? = nil) {
        let event = NavigationEvent(route: route, style: style, activeTab: activeTab)
        self.selectedTab = activeTab ?? 0
        self._event.send(event)
        self.objectWillChange.send()
    }

    public func present(anyRoute: any RouteType, style: NavigationStyle = .none, activeTab: Int?) -> Bool {
        guard let route = anyRoute as? R else {
            return false
        }
        self.present(route, style: style, activeTab: activeTab)
        return true
    }

    public func asAnyRouter() -> AnyRouter {
        AnyRouter(self)
    }
}
