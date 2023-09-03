//
//  EndPoint.swift
//  facebook
//
//  Created by Namlv on 29/08/2023.
//

import Foundation

struct APIEndpoints {
    static func login(with request: LoginRequest) -> Endpoint<BaseResponse<LoginResponse>> {
        return Endpoint(
            path: "api/auth/login",
            method: .post,
            bodyParametersEncodable: request
        )
    }
}
