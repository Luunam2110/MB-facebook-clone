//
//  LoginResponse.swift
//  facebook
//
//  Created by Namlv on 28/08/2023.
//

import Foundation

struct LoginResponse: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case accessToken = "token"
        case refreshToken = "token_refresh"
        case email
    }
    
    let accessToken: String
    let refreshToken: String
    let email: String
}

extension LoginResponse {
    func toDomain() -> UserModel {
        return .init(email: email)
    }
}
