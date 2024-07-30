//  Created by Axel Ancona Esselmann on 7/29/24.
//

import Foundation

public struct AnyRoute {

    private(set) var process: (URL) -> (any RouteType, URL?)?

    public init<R>(_ route: R.Type)
        where R: RouteType
    {
        process = { (url: URL) -> (any RouteType, URL?)? in
            R.process(url)
        }
    }
}
