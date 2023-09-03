//
//  AuthRepository.swift
//  facebook
//
//  Created by Namlv on 29/08/2023.
//

import Foundation

protocol AuthRepository {
    @discardableResult
    func login(
        request: LoginRequest,
        completion: @escaping (Result<LoginModel, DataTransferError>) -> Void
    ) -> Cancellable?
}
