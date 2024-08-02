//  Created by Axel Ancona Esselmann on 8/1/24.
//

import SwiftUI

public struct LoadingView<Content>: View
    where Content: View
{
    private let state: ViewState

    @ViewBuilder
    private var content: () -> Content

    public init(_ state: ViewState, @ViewBuilder content: @escaping () -> Content) {
        self.state = state
        self.content = content
    }

    public var body: some View {
        ZStack {
            content()
            if state.isLoading {
                ProgressView()
            }
        }.alert(isPresented: .constant(state.hasError)) {
            Alert(title: Text(state.error?.localizedDescription ?? "Error"))
        }
    }
}
