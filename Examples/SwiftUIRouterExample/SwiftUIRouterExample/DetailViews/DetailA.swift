//  Created by Axel Ancona Esselmann on 7/30/24.
//

import SwiftUI
import SwiftUIRouter

struct DetailA: View {

    @EnvironmentObject
    var router: AppRouter

    let value: String

    var body: some View {
        VStack {
            Text("detailA, \(value)")
            VStack {
                Button("content2") {
                    router.present(.root.test2)
                }
                Button("with detail") {
                    router.present(.root.test2, .content.c, .detail.c("ccc"))
                }
                Button("detail b 2") {
                    router.present(.detail.b("2"))
                }
                Button("modal detail c 3") {
                    router.present(.detail.c("3"), style: .modal)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.random)
        .navigationTitle("A: \(value)")
    }
}

struct DetailB: View {

    @EnvironmentObject
    var router: AppRouter

    let value: String

    var body: some View {
        VStack {
            Text("detailB, \(value)")
            VStack {
                let newValue = (Int(value) ?? 0) + 1
                Button("detail c \(newValue)") {
                    router.present(.detail.c("\(newValue)"))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.random)
        .navigationTitle("B: \(value)")
    }
}

struct DetailC: View {

    @EnvironmentObject
    var router: AppRouter

    let value: String

    @State
    var userInput: String = ""

    var body: some View {
        VStack {
            Text("detailC, \(value)")
            VStack {
                let newValue = (Int(value) ?? 0) + 1
                Button("detail c \(newValue)") {
                    router.present(.detail.c("\(newValue)"))
                }
                HStack {
                    TextField("go to", text: $userInput)
                    Button("go") {
                        router.present(URL(appUrl: userInput))
                    }
                }.frame(maxWidth: 400)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.random)
        .navigationTitle("C: \(value)")
    }
}

extension Double {
    static var randomUnitInterval: Double {
        .random(in: 0...1)
    }
}

extension Color {
    static var random: Color {
        Color(
            red: Double.randomUnitInterval,
            green: Double.randomUnitInterval,
            blue: Double.randomUnitInterval
        ).opacity(0.3)
    }
}
