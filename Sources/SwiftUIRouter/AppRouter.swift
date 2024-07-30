//  Created by Axel Ancona Esselmann on 7/29/24.
//

import Foundation

public class AppRouter: ObservableObject {

    private var onRoute: (URL) -> Void

    public init(_ onRoute: @escaping (URL) -> Void) {
        self.onRoute = onRoute
    }

    public func present(urls: [URL?], style: NavigationStyle? = nil) {
        var urls = urls.compactMap { url in
            if let style = style {
                return url?.withQueryParameter(key: "style", value: style.parameterName)
            } else {
                return url
            }
        }
        for url in urls {
            onRoute(url)
        }
    }

    public func present(_ urls: (URL?)..., style: NavigationStyle? = nil) {
        present(urls: urls, style: style)
    }
}
