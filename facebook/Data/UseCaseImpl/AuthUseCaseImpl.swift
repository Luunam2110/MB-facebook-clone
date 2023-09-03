//
//  AuthUseCaseImpl.swift
//  facebook
//
//  Created by Namlv on 28/08/2023.
//

import Foundation


final class AuthUseCaseImpl {
    let authRepository : AuthRepository
    
    init(authRepository: AuthRepository) {
        self.authRepository = authRepository
    }
}

extension AuthUseCaseImpl: AuthUseCase {
    func login(
        request: LoginRequest,
        complete: @escaping (Result<LoginModel, DataTransferError>) -> Void
    ) -> Cancellable? {
        return authRepository.login(request: request, completion: complete)
    }
    
}
