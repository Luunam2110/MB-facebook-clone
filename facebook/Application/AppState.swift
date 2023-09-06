

import Foundation

class AppState: NSObject {
    static let shared = AppState()

    var isAuthorited: Observable<Bool> = Observable(false)
    
    deinit {
        isAuthorited.clearObservers()
    }
}
