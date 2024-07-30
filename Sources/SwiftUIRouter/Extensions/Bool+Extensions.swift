//  Created by Axel Ancona Esselmann on 7/29/24.
//

import Foundation

public extension Bool {
    init(withAnimation url: URL) {
        let components = URLComponents(string: url.absoluteString)
        guard let queryItem = components?.queryItems?.first(where: { $0.name == "with_animation" } ) else {
            self = false
            return
        }
        switch queryItem.value?.lowercased() {
        case "1", "true": self = true
        default: self = false
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
