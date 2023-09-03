
import Foundation

enum NetworkError: AppError {
    case error(statusCode: Int, message: String , description: String?)
    case notConnected
    case cancelled
    case generic(Error)
    case urlGeneration
    case unknowError
}


// MARK: - NetworkError extension
extension NetworkError {
    
    var isMaintenanceError: Bool { return hasStatusCode(500, 599)}
    var isNotFoundError: Bool { return hasStatusCode(404) }
    
    
    func hasStatusCode(_ codeError: Int, _ maxErrorCode: Int? = nil) -> Bool {
        switch self {
        case let .error(code, _ , _):
            return maxErrorCode == nil ? code == codeError : code >= codeError && code <= maxErrorCode!
        default: return false
        }
    }
    
    var message:String {
        switch self {
        case .error(_,let message,_):
            return message
        case .cancelled:
            return NSLocalizedString("Cancelled!", comment: "")
        case .generic(_):
            return NSLocalizedString("Something wen't wrong!", comment: "")
        case .notConnected:
            return NSLocalizedString("Not connect internet!", comment: "")
        case .unknowError:
            return NSLocalizedString("Something wen't wrong!", comment: "")
        case .urlGeneration:
            return NSLocalizedString("Url is incorrect!", comment: "")
            
        }
        
    }
}
