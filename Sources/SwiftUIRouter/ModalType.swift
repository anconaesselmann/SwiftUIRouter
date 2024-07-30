//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUI

public protocol ModalType: View {
    associatedtype Content

    init(@ViewBuilder _ content: @escaping () -> Content)
}
