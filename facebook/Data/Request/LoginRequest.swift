
import Foundation

struct LoginRequest : Encodable {
    private enum CodingKeys: String, CodingKey {
        case useName = "email"
        case password = "pass_word"
    }
    
    let useName: String
    let password: String
    
}

