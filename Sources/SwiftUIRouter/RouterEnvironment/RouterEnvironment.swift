//  Created by Axel Ancona Esselmann on 11/21/24.
//

import Foundation

public struct RouterEnvironment {
    var tag: (any TabType)?
    var isModal: Bool?

    init(tag: (any TabType)? = nil, isModal: Bool? = nil) {
        self.tag = tag
        self.isModal = isModal
    }

    public func reduced(_ nextValue: Self) -> Self {
        var copy = self
        if let tab = nextValue.tag {
            copy.tag = tab
        }
        if let isModal = nextValue.isModal {
            copy.isModal = isModal
        }
        return copy
    }
}
