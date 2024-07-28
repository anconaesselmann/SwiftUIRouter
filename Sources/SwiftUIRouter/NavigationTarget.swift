//  Created by Axel Ancona Esselmann on 7/27/24.
//

import Foundation

public protocol NavigationTarget: Equatable {
    static var `default`: Self { get }
    var isModal: Bool { get }

    init?(_ url: URL)
}
