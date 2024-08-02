//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI
import SharedUI

struct CreatePasswordView: View {

    @StateObject
    var vm: CreatePasswordViewModel

    var body: some View {
        LoadingView(vm.state) {
            VStack {
                SecureField("password", text: $vm.password)
                SecureField("confirm password", text: $vm.passwordConfirmed)
                Button("Complete signup", action: vm.createTapped)
                    .disabled(!vm.isValid)
                Spacer()
            }
        }
    }
}
