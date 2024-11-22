//  Created by Axel Ancona Esselmann on 11/21/24.
//

import Foundation

public struct RouterEnvironment {
    public var tag: (any TabType)?
    public var isModal: Bool?

    public static var modal: Self {
        Self(isModal: true)
    }

    public init(tag: (any TabType)? = nil, isModal: Bool? = nil) {
        self.tag = tag
        self.isModal = isModal
    }

    public func reduced(_ nextValue: Self) -> Self {
        var copy = self
        if let tab = nextValue.tag {
            copy.tag = tab
        }
        if let isModal = nextValue.isModal {
            copy.isModal = true
        }
        return copy
    }
}
