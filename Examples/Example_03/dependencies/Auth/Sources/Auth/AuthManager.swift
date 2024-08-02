//  Created by Axel Ancona Esselmann on 8/1/24.
//

import Foundation

public struct User {
    public let name: String
}

public struct AuthToken {
    public let string: String
}

public protocol AuthServiceType {
    func logIn(name: String, password: String) async throws -> AuthToken
    func createUser(name: String, password: String) async throws -> AuthToken
    func logOut() async throws
}

public struct MockAuthService: AuthServiceType {

    public init() { }
    
    public func logIn(name: String, password: String) async throws -> AuthToken {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return AuthToken(string: UUID().uuidString)
    }

    public func createUser(name: String, password: String) async throws -> AuthToken {
        try await logIn(name: name, password: password)
    }

    public func logOut() async throws {
        try await Task.sleep(nanoseconds: 1_000_000_000)
    }
}

@MainActor
public class AuthManager: ObservableObject {

    public enum UserState {
        case loggedIn(user: User, auth: AuthToken), loggedOut

        public var user: User? {
            switch self {
            case .loggedIn(user: let user, auth: _):
                return user
            case .loggedOut:
                return nil
            }
        }
    }

    private var authService: AuthServiceType

    public init(authService: AuthServiceType) {
        print("Created auth manager")
        self.authService = authService
    }

    @Published
    public private(set) var state: UserState = .loggedOut {
        didSet {
            print(state)
        }
    }

    public func logIn(name: String, password: String) async throws {
        let token = try await authService.logIn(name: name, password: password)
        state = .loggedIn(user: User(name: name), auth: token)
    }

    public func createUser(name: String, password: String) async throws {
        let token = try await authService.createUser(name: name, password: password)
        state = .loggedIn(user: User(name: name), auth: token)
    }

    public func logOut() async throws {
        try await authService.logOut()
        print("logged out \(state.user?.name ?? "none")")
        state = .loggedOut
    }
}
