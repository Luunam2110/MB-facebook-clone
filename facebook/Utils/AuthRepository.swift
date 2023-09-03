//
//  AuthRepository.swift
//  facebook
//
//  Created by Namlv on 28/08/2023.
//

import Foundation

protocol AuthRepository {
    func login(
        username : String,
        password :String ,
        completion : @escaping (Result<LoginModel, Error>) -> Void
    )
}
