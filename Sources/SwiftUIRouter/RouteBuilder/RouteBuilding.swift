//  Created by Axel Ancona Esselmann on 10/16/24.
//

import Foundation

public protocol RouteBuilding: RouteType, RawRepresentable
    where
        Self.RawValue == String
{
    static var builder: RouteBuilder<Self> { get }
}

public extension RouteBuilding where Self: RouteType, Self.RawValue == String {
    init?(rawValue: String) {
        self.init(Self.builder, rawValue: rawValue)
    }

    init?(_ builder: RouteBuilder<Self>, rawValue: String) {
        guard let route = builder.build(rawValue) else {
            return nil
        }
        self = route
    }

    var rawValue: String {
        "\(self)".replacing(")", with: "").replacing("(", with: "/")
    }
}
