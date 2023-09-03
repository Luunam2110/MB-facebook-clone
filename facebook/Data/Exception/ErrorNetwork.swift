//
//  ErrorNetwork.swift
//  facebook
//
//  Created by Namlv on 03/09/2023.
//

import Foundation

struct ErrorResponse: Decodable {
    let status: Bool
    let description: String
    let message: String
    let statuscode: Int

    private enum CodingKeys: String, CodingKey {
        case status
        case description
        case message
        case statuscode = "code" 
    }
}



