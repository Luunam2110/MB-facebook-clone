
import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let status: Bool
    let code: Int
    let message: String
    let description: String
    let data: T
    
    private enum Codingkeys: String, CodingKey {
        case code
        case status
        case message
        case description
        case data
    }
    
}
