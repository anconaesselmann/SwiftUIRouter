//  Created by Axel Ancona Esselmann on 10/16/24.
//

import Foundation

public extension String {
    var uuid: UUID? {
        UUID(uuidString: String(self))
    }
}
