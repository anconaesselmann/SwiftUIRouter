//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI

public protocol NavigationTargetType: View {
    associatedtype R
        where R: RouteType
    associatedtype Content
        where Content: View
}
