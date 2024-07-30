//  Created by Axel Ancona Esselmann on 7/29/24.
//

import Foundation

public enum NavigationStyle: String {
    case none, modal, withAnimation

    public var parameterName: String {
        switch self {
        case .none:
            return "none"
        case .modal:
            return "modal"
        case .withAnimation:
            return "with_animation"
        }
    }
}

public extension NavigationStyle {
    init(_ url: URL) {
        let components = URLComponents(string: url.absoluteString)
        guard let queryItem = components?.queryItems?.first(where: { $0.name == "style" } ) else {
            self = .none
            return
        }
        switch queryItem.value?.lowercased() {
        case "with_animation": self = .withAnimation
        case "modal": self = .modal
        default: self = .none
        }
    }
}
