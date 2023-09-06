//
//  AuthUseCase.swift
//  facebook
//
//  Created by Namlv on 28/08/2023.
//

import Foundation
protocol AuthUseCase {
    func login (request: LoginRequest,
                complete: @escaping (Result<UserModel, DataTransferError>) -> Void
    ) -> Cancellable?
}
