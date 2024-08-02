//  Created by Axel Ancona Esselmann on 7/31/24.
//

import SwiftUI

struct UserInfoView: View {

    @StateObject
    var vm: UserInfoViewModel

    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $vm.name)
                TextField("Email", text: $vm.email)
                DatePicker("DOB", selection: $vm.dob)
                Button("next", action: vm.next)
                    .disabled(!vm.isValid)
            }
            Spacer()
        }
    }
}
