
import Foundation


enum DataTransferError: AppError {
    case noResponse
    case parsing(Error)
    case networkFailure(NetworkError)
    case resolvedNetworkFailure(Error)
}
extension DataTransferError {
    var message: String {
        switch self {
        case .noResponse:
            return NSLocalizedString("Non response", comment: "")
        case .networkFailure(let err):
            return err.message
        default :
            return NSLocalizedString("Something wen't wrong!", comment: "")
        }
    }
}

