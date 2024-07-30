//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI

public struct DeeplinkView<Content>: View
    where Content: View
{

    @EnvironmentObject
    private var appRouter: AppRouter

    private let urlTypes: Set<String>
    private let content: () -> Content

    public init(
        urlTypes: Set<String>,
        @ViewBuilder
        content: @escaping () -> Content
    ) {
        self.urlTypes = urlTypes
        self.content = content
    }

    public var body: some View {
        content()
            .handlesExternalEvents(
                preferring: urlTypes,
                allowing: urlTypes
            )
            .onOpenURL(perform: { url in
                appRouter.present(url)
            })
    }
}

public extension DeeplinkView {
    init(
        urlType: String,
        @ViewBuilder
        content: @escaping () -> Content
    ) {
        self = .init(urlTypes: [urlType], content: content)
    }

    init<Link>(
        _ urlType: Link.Type,
        @ViewBuilder
        content: @escaping () -> Content
    ) 
        where 
            Link: RawRepresentable, Link.RawValue == String,
            Link: CaseIterable
    {
        self = .init(urlTypes: Set(urlType.allCases.map { $0.rawValue }), content: content)
    }

    init<Link>(
        _ urlType: Link,
        @ViewBuilder
        content: @escaping () -> Content
    )
        where Link: RawRepresentable, Link.RawValue == String
    {
        self = .init(urlTypes: [urlType.rawValue], content: content)
    }
}
