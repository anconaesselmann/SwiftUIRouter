//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI

extension Color {
    static var random: Color {
        Color(
            red: Double.randomUnitInterval,
            green: Double.randomUnitInterval,
            blue: Double.randomUnitInterval
        ).opacity(0.3)
    }
}
