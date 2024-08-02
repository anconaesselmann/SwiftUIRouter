//  Created by Axel Ancona Esselmann on 8/1/24.
//

import Foundation

public enum ViewState {
    case idle
    case loading
    case error(Error)

    public var isLoading: Bool {
        switch self {
        case .loading: return true
        default: return false
        }
    }

    public var hasError: Bool {
        switch self {
        case .error: return true
        default: return false
        }
    }

    public var error: Error? {
        switch self {
        case .error(let error): return error
        default: return nil
        }
    }
}
