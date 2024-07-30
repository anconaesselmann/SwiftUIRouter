//  Created by Axel Ancona Esselmann on 7/29/24.
//

import SwiftUI

struct Sheet<Content>: View where Content: View {
    @Environment(\.dismiss) private var dismiss

    @ViewBuilder
    var content: Content

    var body: some View {
        VStack {
            HStack {
                Button("x") {
                    dismiss()
                }
                Spacer()
            }
            content.frame(maxHeight: .infinity)
        }
    }
}
