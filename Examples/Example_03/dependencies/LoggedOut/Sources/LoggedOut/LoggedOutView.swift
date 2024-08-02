//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SharedUI

public struct LoggedOutView: View {

    @StateObject
    public var vm: LoggedOutViewModel

    public init(vm: LoggedOutViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }

    public var body: some View {
        LoadingView(vm.state) {
            VStack {
                TextField("User name", text: $vm.userName)
                SecureField("Password", text: $vm.password)
                HStack {
                    Button("Log in", action: vm.logInPressed)
                    Button("Sign up", action: vm.signUp)
                }
            }
        }
    }
}
